#ifndef KAT_LUMAINJECTOR
#define KAT_LUMAINJECTOR

#include "CGI_PoiAudioLink.cginc"

//Thry Settings
fixed _EnableLuma;
fixed _ALMappingBass; // Default Luma LOW Band
fixed _ALMappingLowMid; // "Heroes 1"
fixed _ALMappingHighMid; // "Vilains1"
fixed _ALMappingTreble; // Luma High Band
fixed _EmissionPulseVariation;
fixed _LumaTextureVisualization;

//========  GLOBAL  ==========
// Luma: 2 AudioBands - 7 Zones
#define LUMAAUDIOBANDS 2 
#define LUMAZONES 7

// AUDIOLINK
#define ALAUDIOBANDS 4
#define ALZONES 4 // TODO remap to chords for Poiyomi 8.0

float4 _Stored_TexelSize;
uniform sampler2D _Stored;


//========  ZONE/AUDIO INFO  ==========
	float2 lumaAudioData ;
	int ALMapping[ALAUDIOBANDS];
	float2 lumaZonesData[LUMAZONES] ;

//	int _SimulationMode ; //TODO
//	float3 simuZonesData[LUMAZONES];

bool isLumaWorld()
{
	return _Stored_TexelSize.z > 1;
}

// Thry mapping : 
// 0,1 => audio LOW/HIGH
// 3,4,5,6 => Luma zones 1-4 (3,4 = Heroes, 5,6 = Vilains)
float getLumaData(int band, fixed time, fixed width, int variation)
{
	float data = 0;
	int lumaIdx = ALMapping[band];
	float StoredTextureTo = step(max(_Stored_TexelSize.z, _Stored_TexelSize.w), 500.0);
	float2 offsetHeroesVilains = float2( 0.1,0.471 );

	if(lumaIdx <=1)	// LUMA AUDIO 0,1
	{
		float2 lumaAudioReactiveZone = ( float2( 0.673,0.985 ) - offsetHeroesVilains );			
		lumaAudioData = saturate((StoredTextureTo + tex2D(_Stored, lumaAudioReactiveZone)));
		data = lumaAudioData[lumaIdx]; // 0=.x(LOW) , 1=.y(HIGH)
	}
	else if(lumaIdx >=3) // LUMA ZONES x4  [3,4,5,6]
	{
		lumaZonesData[3] = ( float2( 0.955,0.992 ) - offsetHeroesVilains );
		lumaZonesData[4] = ( float2( 0.964,0.992 ) - offsetHeroesVilains );
		lumaZonesData[5] = ( float2( 0.955,0.978 ) - offsetHeroesVilains );
		lumaZonesData[6] = ( float2( 0.964,0.978 ) - offsetHeroesVilains );

		float2 lumaZoneLocation = lumaZonesData[lumaIdx];
		float3 rgb = saturate( StoredTextureTo + tex2D(_Stored, lumaZoneLocation ));
		data = (rgb.r + rgb.g + rgb.b)/3;
	}

	if (variation == 1) data = saturate(0.5*data + 0.3*cos(2*time) - 0.3 * sin(time*width));

	return data;
}

void initAudioBands()
{
	
	ALMapping[0] = _ALMappingBass;
	ALMapping[1] = _ALMappingLowMid;
	ALMapping[2] = _ALMappingHighMid;
	ALMapping[3] = _ALMappingTreble;

	if (!_EnableLuma || !isLumaWorld()) { AL_initAudioBands(); return;}
		
	for (int i=0;i<4;i++)
		poiMods.audioLink[i] = getLumaData(i, 0, 0, _EmissionPulseVariation);
	
	poiMods.audioLinkTextureExists = 1;

	if (_LumaTextureVisualization == 1)
	{
		poiMods.audioLinkTexture = tex2D(_Stored, poiMesh.uv[0]);
	}
}

float getBandAtTime(float band, fixed time, fixed width)
{
	if (!_EnableLuma || !isLumaWorld()) { return AL_getBandAtTime( band,  time,  width); }
	return getLumaData(band, time, width, _EmissionPulseVariation);
}

#endif