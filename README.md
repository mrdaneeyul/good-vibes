# vibration
GameMaker Studio 2 plugin for device vibration! This plugin allows for simple or complex timed vibrations.

Normally, GameMaker will just vibrate a gamepad until you manually turn it off; this plugin handles that for you. You can set the duration of the vibration in frames independently for left and right motors.

This plugin makes use of animation curves to allow for complex vibration patterns. Included are some sample patterns, including linear fadein, fadeout, panning between motors, and square wave pulses.

# how to use

Download the chosen .yymps file. Click and drag it into your GameMaker Studio 2 project. Be sure to Import All!

You can optionally download the test project and see how functions are used.

# notes

Currently, GameMaker does not support vibration on Mac, Linux, or mobile devices. It may be possible to provide partial support through Steam Input. YellowAfterlife has a related Steam Input extension that could be leveraged.

Windows 8 and below do not have proper support for left and right vibration on certain gamepads and trying to set these separately can cause issues. As such, for these OSes, Vibration mixes left and right vibration into the right motor. It may be possible via extension to pick out these specific controllers (\*cough\* Xbox One \*cough\*), but in vanilla GameMaker we have no way of determining this.
