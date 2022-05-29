#ifndef KAT_LUMAINJECTOR
#define KAT_LUMAINJECTOR

#include "CGI_PoiAudioLink.cginc"

//Thry Settings
float _EnableLuma;
fixed _ALMappingBass; // Default Luma LOW Band
fixed _ALMappingLowMid; // "Heroes 1"
fixed _ALMappingHighMid; // "Vilains1"
fixed _ALMappingTreble; // Luma High Band
fixed _EnableEmissionPulseVariation;
fixed _EmissionPulseVariation;
fixed _EmissionPulseVariationMinValue;
fixed _LumaTextureVisualization;
fixed _EnableEmissionBidirectionnalVariation;
fixed _EmissionBlinkingVariation;
fixed _EmissionBlinkingVariationMinValue;
float _LumaDataAudioMultiplicator;
float _LumaDataZoneMultiplicator;
float _LumaDataGradientZoneMultiplicator;

//========  GLOBAL  ==========
// Luma: 2 AudioBands - 7 Zones
#define LUMAAUDIOBANDS 2 
#define LUMAZONES 7

// AUDIOLINK
#define ALAUDIOBANDS 4
#define ALZONES 4 // TODO remap to chords for Poiyomi 8.0

float4 _Stored_TexelSize;
UNITY_DECLARE_TEX2D(_Stored);

//========  ZONE/AUDIO INFO  ==========
	float2 lumaAudioData ;
	int ALMapping[ALAUDIOBANDS];
	int ALMappingGradient[ALAUDIOBANDS];

	float2 lumaZonesData[LUMAZONES] ;

//	int _SimulationMode ; //TODO
//	float3 simuZonesData[LUMAZONES];

bool isLumaMode()
{
	float width = 0;
	float height = 0;
	_Stored.GetDimensions(width, height);
	return (_EnableLuma && min(width,height) >=128);
}


// Thry mapping : 
// 0,1 => audio LOW/HIGH
// 3,4,5,6 => Luma zones 1-4 (3,4 = Heroes, 5,6 = Vilains)
float getLumaData(int band, fixed time, fixed width, int variation, int bidirectionnalVariation)
{
	float data = 0;
	float basedata = 0;
	int mainMappingIndex = ALMapping[band];
	float2 offsetHeroesVilains = float2( 0.1,0.471 );

	if(mainMappingIndex <=1)	// LUMA AUDIO 0,1
	{
		float2 lumaAudioReactiveZone = ( float2( 0.673,0.985 ) - offsetHeroesVilains );			
		lumaAudioData = saturate((UNITY_SAMPLE_TEX2D(_Stored, lumaAudioReactiveZone)));
		data = _LumaDataAudioMultiplicator * lumaAudioData[mainMappingIndex]; // 0=.x(LOW) , 1=.y(HIGH)
	}
	if(mainMappingIndex ==2)	// 3 Gradient Zones, need second mapping because of UI limitation of max enums to 7 
	{
		float GradientWidth = 0.107;
		lumaZonesData[0] = float2(0.57,0.49 ); 	// Gradient 1
		lumaZonesData[1] = float2(0.6805,0.49); // Gradient 2
		lumaZonesData[2] = float2(0.791,0.49);	// Gradient 3

		int lumaGradientIndex = ALMappingGradient[band];
		float2 lumaZoneLocation = lumaZonesData[lumaGradientIndex];
		lumaZoneLocation.x += GradientWidth/2; // use middle of gradient 

		float3 rgb = saturate( UNITY_SAMPLE_TEX2D(_Stored, lumaZoneLocation ));
		data = basedata = _LumaDataGradientZoneMultiplicator * (rgb.r + rgb.g + rgb.b)/3;
	}	
	else if(mainMappingIndex >=3) // LUMA ZONES x4  [3,4,5,6]
	{
		lumaZonesData[3] = ( float2( 0.955,0.992 ) - offsetHeroesVilains );
		lumaZonesData[4] = ( float2( 0.964,0.992 ) - offsetHeroesVilains );
		lumaZonesData[5] = ( float2( 0.955,0.978 ) - offsetHeroesVilains );
		lumaZonesData[6] = ( float2( 0.964,0.978 ) - offsetHeroesVilains );

		float2 lumaZoneLocation = lumaZonesData[mainMappingIndex];
		float3 rgb = saturate( UNITY_SAMPLE_TEX2D(_Stored, lumaZoneLocation ));
		data = basedata = _LumaDataZoneMultiplicator * (rgb.r + rgb.g + rgb.b)/3;
	}

	if (variation == 1) 
	{
		data =  saturate(0.5*data + _EmissionPulseVariation*(_EmissionPulseVariationMinValue*cos(2*time) - _EmissionPulseVariationMinValue * sin(time*width)));
	}

	if (bidirectionnalVariation == 1) 
	{
		data =  _EmissionBlinkingVariationMinValue* data*saturate(poiLight.nDotV)* (sin(time * 2) * abs(cos(_EmissionBlinkingVariation*_Time.w*3 ) + 2*sin(_EmissionBlinkingVariation*_Time.w*2 + width  )) + data)  ;
	}

	return data;
}

void initAudioBands()
{

	ALMapping[0] = _ALMappingBass;
	ALMapping[1] = _ALMappingLowMid;
	ALMapping[2] = _ALMappingHighMid;
	ALMapping[3] = _ALMappingTreble;

	if (!isLumaMode()) { AL_initAudioBands(); return;}
		
	for (int i=0;i<4;i++)
		poiMods.audioLink[i] = getLumaData(i, 0, 0, _EnableEmissionPulseVariation, 0);
	
	poiMods.audioLinkTextureExists = 1;

	if (_LumaTextureVisualization == 1)
	{
		poiMods.audioLinkTexture = UNITY_SAMPLE_TEX2D(_Stored, poiMesh.uv[0]);
	}
}

float getBandAtTime(float band, fixed time, fixed width)
{
	if (!isLumaMode()) { return AL_getBandAtTime( band,  time,  width); }
	return getLumaData(band, time, width, _EnableEmissionPulseVariation, _EnableEmissionBidirectionnalVariation);
}

#endif