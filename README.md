# This is a modified version of the original Poiyomi Shader with added Luma structure support
The main goal is to bring support for the reactive Luma/Audio structure pixels that are used to make the avatars react in the [Furality](https://furality.org/) convention's worlds.

The structure was made to work with the Furality's own shader and be controlled in real time by VJs during Furality's events, but the shader has to support it to react to the world.
Furality's shader is nice and is the best to use for the event if you don't already have audiolink materials on your avatars or have time to port them.
I'll use both myself as the Furality shader has nice extra themed effects that the VJs can control too.

But if you're like me, you might already have a bunch of Avatars using poiyomi with audiolink reactive materials with a lof of audiolink tweaked effects, migrating all avatars and materials to Furality's shader would be a lot of work and to do in a short time.

This shader will be a drop in replacement for the original poiyomi that will allow you to reuse these audiolink materials as-is and make them react inside of Furality's worlds without further modifications.
They will however react "poiyomi style" and depend on your existing poiyomi's audiolink configuration.


# Requirements
- For the moment the Luma Injector is added into the 7.3 version of poiyomi, so your materials must use that version to benefit from it. (I might see later on to add it to 8.0 too but most people are still using 7.3 atm imho)
- The Luma Injector is injecting/remapping into poiyomi's existing audiolink system, as such your materials must have audiolink activated.

# Installation
This version package will simply install/replace the existing _PoiyomiShaders Toon folder like the original unitypackage does.
- click onto the Kat unitypackage to import it into unity, it should autodetect changes (if it doesn't you can also simply delete the existing _PoiyomiShaders folder in Assets before hand , then import the new unitypackage)

It might not be necessary but as Poiyomi has its locking materials, the optimized shaders when your material are locked are like a specific shader copy of when it was locked. 
In order to force a refresh with the new code, you might need to unlock / relock all the poiyomi materials:
- click onto all you avatars you want to upgrade to the Poi-Luma version in unity's Hierarchy. (ctrl + click for multiple selection)
- Then right click on the selections and choose Thry=> materials => UnlockAll
- Then do the same with Thry=> materials => LockAll

# Configuration
This version of the shader will allow you to inject and remap into audiolink's 4 audio channels:
- The 2 Furality audio channels (LOW and HIGH)
- The 4 Luma "Heroes and Vilains" Zones (they will most likely be called differently for furality Aqua but the data structure is the same, so they should work the same)


In addition there is an Emision Pulse Variation parameter: what it does is that it makes the animations/values vary through time.
when it's checked it will look more like a pulsing effect compared to blinking "hard" when it's unchecked.
It's mostly used for audiolink centerOut and such that are originally using AudioLink's temporal history which Luma doesn't have.
So that setting tries to emulate something so that it doesn't only blinks "Hard"
(ie what it does when you uncheck the box)

Without having past values history the effect will however be different than the original AudioLink Center Out for example though.
I might see about improving that at some point and add more effects.


# Uninstallation
Same procedure but with the original poiyomi package instead of the Kat Luma package.

It should be pretty straightforward but as usual with unity: backup everything before hand in case something goes wrong, so that you can restore the full project too :D

# Credits:
- Poiyomi Shader by .. Poiyomi :)
- Original Luma Shader created by Naito Ookami

## Original Poiyomi shader information:
-  [Join the discord here](https://poiyomi.com)
- [Download the latest unity package here](https://github.com/poiyomi/PoiyomiToonShader/releases/latest)

Make a donation there for his work if you have not done so already,  99.9% of the shader is his :)



