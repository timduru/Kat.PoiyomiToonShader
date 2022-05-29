# This is a modified version of the original Poiyomi Shader with added Luma structure support
Please note that it is not an official Furality Luma Shader, so don't ask for support to Furality staff about it.

The main goal is to bring Luma support directly into the feature rich poiyomi shader for the reactive Luma/Audio structure pixels that are used to make the avatars react in the [Furality](https://furality.org/) convention's worlds.

The structure was made to work with Furality's own shader and be controlled in real time by VJs during Furality's events, but the shader has to support it to react to the world.
Furality's shader is nice and is the best to use for the event if you don't already have audiolink materials on your avatars or have time to port them.
I'll use both myself as the Furality shader has nice extra themed effects that the VJs can control too.

But if you're like me, you might already have a bunch of Avatars using poiyomi with audiolink reactive materials with a lof of audiolink tweaked effects, migrating all avatars and materials to Furality's shader would be a lot of work and to do in a short time.

This shader's will be a drop in replacement for the original poiyomi that will allow you to reuse these audiolink materials as-is and make them react inside of Furality's worlds without further modifications.
They will however react "poiyomi style" and depend on your existing poiyomi's audiolink configuration.

# Latest package: see [Releases/Assets](https://github.com/timduru/Kat.PoiyomiToonShader/releases) 

# Requirements
- For the moment the Luma Injector is added into the 7.3 Free Toon version of poiyomi, so your materials must use that version to benefit from it. (I might see later on to add it to 8.0 too but most people are still using 7.3 atm imho)
- The Luma Injector is injecting/remapping into poiyomi's existing audiolink system, as such your materials must have audiolink activated and configured on your material for it to do something.
- As this version is based onto the Free Poiyomi Toon shader, if you are on the Pro version you would need to switch your material back to the toon 7.3 version.


# Installation
This package will simply install/replace the existing _PoiyomiShaders folder of the Free Poiyomi Toon version,  like the original unitypackage does.
- click onto the Kat unitypackage to import it into unity, it should autodetect file changes (if it doesn't and that you are only using 7.x Toon already, you can also simply delete the existing _PoiyomiShaders folder in Assets before hand, then import the new unitypackage)

In order to force a refresh with the new shader code, you will need to unlock / relock all the poiyomi materials you want to use with the new shader:
- click onto all you avatars you want to upgrade to the Poi-Luma version in unity's Hierarchy. (ctrl + click for multiple selection)
- Then right click on the selections and choose Thry=> materials => UnlockAll
- Then do the same with Thry=> materials => LockAll

You can also unlock/relock specific individual materials as needed instead of all materials.
If your materials are not using Poioyomi Toon 7.3.x already, you will need to switch the material to that first.
It should show that it is using a  -KatLumaXXXX version similar to this capture: 

![image](https://user-images.githubusercontent.com/2088877/170861955-33baeae4-8ef7-4b3c-b8b0-b9b0953693c7.png)


# Configuration
This version of the shader will allow you to inject and remap into the 4 audiolink channels:
- The 2 Furality audio channels (LOW and HIGH)
- The 4 Luma "Heroes and Vilains" Zones (they will most likely be called differently for furality Aqua but the data structure is the same, so they should work the same)
- The 3 Luma2 Gradient Zones 

![image](https://user-images.githubusercontent.com/2088877/170865420-80e9708f-6f4a-4615-b9c6-8846c5fc1d48.png)

The shader includes Luma Worlds autodetection, so you can also leave it on at all time, and when you're not in a luma world it'll automatically switch back to audiolink only.
You also have the Enable switch that can be animated so that you can enable/disable the feature at will at run time through an animation in case autodetection fails. 
When Disabled the behaviour will simply also go back and behave like before with the regular audiolink driver.

## Luma Data Multiplicators
You have 3 multiplicators available:
- Luma Audio Data
- Luma Zone Data
- Luma Gradient Zone Data

If you animate these with a menu slider they will allow you to quickly correct the live values fed by the world.
It happened last year for example that the audio data sent by the world were too low or too high and saturated for some of the DJs
So the Audio Data Multiplicator will allow to correct that in real time.
The zones data are usually controlled by the VJs and their levels are usually ok, but just in case there's also 2 other sliders for them too :)
You can also turn off one or more Data structure type if you set its multiplicator to 0 that way too.

## Additional variation parameters
In addition there is an Emission Pulse Variation option: what it does is that it makes the animations/values vary through time.
when it's checked it will look more like a pulsing effect compared to blinking "hard" when it's unchecked.
It's mostly used for audiolink centerOut and such that are originally using AudioLink's temporal history which Luma doesn't have.
So that setting tries to emulate something so that it doesn't only blinks "Hard" (it will however not look like the original CenterOut with audiolink)
You can fine tune it more if needed: 
- Variation Strength is the amount of variation introduced in addition to the luma data
- Variation amount of emission to keep active when no data: allows to set how much of the emission you want to keep when the luma data has a value of 0. that way your emission is not fully dark even when there is no activity in luma zones. 
- Additionnal bidirectional effect on top of luma data, with speed, and amount sliders

The Debug Visualize Luma Texture option, is just that: it'll override the material so that it can display the Luma Data texture for debug purposes. I guess not many are going to use it, but it's there if you need it ;)


# Uninstallation
Same procedure but with the original poiyomi package instead of the Kat Luma package.

It should be pretty straightforward but as usual with unity: backup everything before hand in case something goes wrong, so that you can restore the full project too :D


# Links:

## Original Poiyomi shader information:
-  [Join the discord here](https://poiyomi.com)
- [Download the latest unity package here](https://github.com/poiyomi/PoiyomiToonShader/releases/latest)

Make a donation there for his work if you have not done so already,  99.9% of the shader is his :)

## Official Furality Shader created by Naito Ookami can be found on Furality's website: 
- [Furality.org](https://furality.org)





