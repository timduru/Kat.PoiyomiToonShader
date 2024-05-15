# This is a modified version of the original Free Poiyomi Shader 9.0.x with added Furality Umbra/Sylva color structures support
Please note that it is not an official Furality Luma Shader, so don't ask for support to Furality staff about it.

The main goal is to bring Luma / Umbra support directly into the feature rich poiyomi shader for the reactive Furality Luma Zones and Gradients structures that are used to make the avatars react in the [Furality](https://furality.org/) convention's worlds.

Since Furality Sylva, the Furality worlds are also audiolink compatible, so you could use a default Poiyomi shader and be "audio reactive" in their worlds too, but it'd react with the regular audiolink color themes
To benefit from all the specific synchronized zones & gradients controlled by the Furality VJs for each DJ Set or in other non club Furality worlds, 
the shader needs to specifically support them.

This is what these shader modifications are doing :)


# Latest KatUmbra shader: 
Simply download the KatFuralityUmbra-PoiyomiToon-9.0.shader from the latest [Releases/Assets](https://github.com/timduru/Kat.PoiyomiToonShader/releases)


# Requirements
- Install the regular Free Poiyomi 9.0.x package


# Installation
- Drop the KatFuralityUmbra-PoiyomiToon-9.0.shader file where you want in your unity project. 
- Wait that it finishes compiling.

If your material is already on a Poi9.0.x version, simply switch to this shader version from the Material shader droplist:
Kat/Umbra/Poiyomi Toon-9.0
![image](https://github.com/timduru/Kat.PoiyomiToonShader/assets/2088877/5d3d725e-d9f2-4b71-b6df-a4cc59786fb5)


# Feature List
- SpecialFX/Emissions0-3: Added Support for Luma Zones 1-4 & Luma Gradients 1-3
- Audiolink Configuration: Add basic support for on the fly level corrections on the avatar side
- The shader also includes Luma Worlds autodetection:

	If you're in a furality world it'll use the furality colors from the world,
	if you're in a audiolink world it'll fallback to using the AudioLink colors just like the native Poi shader does. 
			(meaning you can keep your material as is and it'll work in both types of worlds)


# Configuration

## SpecialFX/ Emissions0-3:  Umbra Configuration
After configuring the Poiyomi Emissions like you would for a regular Audiolink reaction,
you simply need to pick the Luma Zone1-4 or Gradient1-3 from the original Poiyomi drop list

![image](https://github.com/timduru/Kat.PoiyomiToonShader/assets/2088877/c2c7799b-cac4-48ec-8a9a-dd934f654187)

	
	Note that you can also animate the value from the droplist as you would with any poi parameters. 
	So you can change the zones / gradients you are using on the fly through VRChat's menus and an animation as usual. 
	

## AudioLink Level Extra Configurations
- Multiplier: Multiplies the audiolink band values retrieved by this value. (usefull for worlds where audiolink is set to very low levels but still registering something) 
- Offset: Adds the value to the audiolink band values retrieved. (Usefull if you still want to light up your emissions a bit even in world that doesn't register anything in the audio levels. )
- clamp min/max: clamps the audiolink band values with these settings, so it'll never be over or under the Min / Max (clamp max is usefull for example if you don't want to light up like a christmass tree in world that have levels set too high)

![image](https://github.com/timduru/Kat.PoiyomiToonShader/assets/2088877/b9c6551a-5432-4912-91ed-7df0e840da66)

	Note: If you animate these with a menu slider they will allow you to quickly correct the live values fed by the world. 
	(It works also in non Furality worlds)
	Currently it does the correction for all 4 AL bands


# Testing 
Join the Furality Sylva test world:
Luma structures are the same for Umbra so it should be compatible.

https://vrchat.com/home/world/wrld_3f72a6ea-ecfb-4f27-a730-750ca6d97401


# Uninstallation
Delete the KatUmbra shader file from where you dropped it into your project. 


# Links:

## Original Poiyomi shader information:
-  [Join the discord here](https://poiyomi.com)
- [Download the latest unity package here](https://github.com/poiyomi/PoiyomiToonShader/releases/latest)

Make a donation there for his work if you have not done so already,  99.9% of the shader is his :)

## Official Furality Shader created by Naito Ookami can be found on Furality's website: 
- [Furality.org](https://furality.org)






