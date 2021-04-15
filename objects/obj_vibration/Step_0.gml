/// @description vibrate and increase timers

var _vibrationStrengthL = 0;
var _vibrationStrengthR = 0;

if (timerL <= 1)
	_vibrationStrengthL = strengthL * animcurve_channel_evaluate(curveChannelL, timerL);
if (timerR <= 1)
	_vibrationStrengthR = strengthR * animcurve_channel_evaluate(curveChannelR, timerR);

gamepad_set_vibration(device, _vibrationStrengthL, _vibrationStrengthR);

timerL += timerIncrementL;
timerR += timerIncrementR;

if (timerL >= 1 && timerR >= 1)
	instance_destroy();