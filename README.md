# vibration
GameMaker Studio 2 plugin for device vibration! This plugin allows for simple or complex timed vibrations.

Normally, GameMaker will just vibrate a gamepad until you manually turn it off; this plugin handles that for you. You can set the duration of the vibration in frames independently for left and right motors.

This plugin also can make use of animation curves to allow for complex vibration patterns. Included are some sample patterns, including linear fadein, fadeout, panning between motors, and square wave pulses.

# how to use

Download the chosen .yymps file. Click and drag it into your GameMaker Studio 2 project. Be sure to Import All!

To do a simple vibration, simply call `Vibrate()` once (not every frame), passing in the vibration strength (0 to 1), duration (in frames), and optionally the device you want to vibrate (default is 0, the first device plugged in). For example, `Vibrate(0.75, 200);` will vibrate the first device at 3/4 strength for 200 frames, and `Vibrate(1, 10, 2);` will vibrate the third device (index 2) at full strength for 10 frames.

To do a complex vibration, call `VibrateExtended()`. This function has parameters for distinct left and right strength and durations. Device is optional, and animation curve is optional (it defaults to a flat line, i.e. vibration strength does not change over time). Any animation curve can be passed in here as long as it has at least one channel. If the curve has one channel, both motors will do the same thing. If the curve has two channels, they should be named "left" and "right" for the left and right motors, respectively. Animation curves should range from 0 minimum to 1 maximum, otherwise you probably won't get the results you expect. :)

You can optionally download the test project and see how functions are used.

# notes

Currently, GameMaker does not support vibration on Mac, Linux, or mobile devices. It may be possible to provide partial support through Steam Input. YellowAfterlife has a related Steam Input extension that could be leveraged.

Windows 8 and below do not have proper support for left and right vibration on certain gamepads and trying to set these separately can cause issues. As such, for Windows 8 and below, this plugin mixes left and right vibration into the right motor. It may be possible via extension to pick out these specific controllers (\*cough\* Xbox One \*cough\*), but in vanilla GameMaker we have no way of determining this.
