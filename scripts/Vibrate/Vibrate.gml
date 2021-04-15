/// @description vibrates the specified device
/// @param strength
/// @param duration - in frames
/// @param [device] - default 0
function Vibrate() {
	var _strength = clamp(argument[0], 0, 1);
	var _duration = argument[1];
    var _device = ((argument_count > 2) && (argument[2] != undefined))? argument[2] : 0;
	VibrateExtended(_strength, _strength, _duration, _duration, _device);
}

/// @description vibrates the specified device and can optionally pass in animation curves for left and right vibration channels
/// @param strengthLeft
/// @param strengthRight
/// @param durationLeft - in frames
/// @param durationRight - in frames
/// @param [device] - default 0
/// @param [animationCurve] - default crv_vibrate_flat. Any animation curve can be passed in with 1 channel with any name or 2 channels named "left" and "right"
function VibrateExtended() {
	var _strengthL = clamp(argument[0], 0, 1);
	var _strengthR = clamp(argument[1], 0, 1);
	var _durationL = argument[2];
	var _durationR = argument[3];
    var _device = ((argument_count > 4) && (argument[4] != undefined))? argument[4] : 0;
	var _animationCurve = ((argument_count > 5) && (argument[5] != undefined))? argument[5] : crv_vibrate_flat;
		
	VibrateStop(_device); //override any previous vibration
	
	with (instance_create_depth(0, 0, 0, obj_vibration))
	{				
		strengthL = _strengthL;
		strengthR = _strengthR;
		timerIncrementL = 1 / (_durationL > 0 ? _durationL : 1);
		timerIncrementR = 1 / (_durationR > 0 ? _durationR : 1);
		device = _device;
		
		#region set curve channels
		
		var _animationCurve = animcurve_get(_animationCurve);
		var _channelCount = array_length(_animationCurve.channels);
		if (_channelCount <= 0)
			show_error("Animation curve \"" + _animationCurve.name + "\" doesn't have any channels.", true);
		else if (_channelCount == 1)
		{
			curveChannelL = animcurve_get_channel(_animationCurve, 0)
			curveChannelR = animcurve_get_channel(_animationCurve, 0)
		}
		else
		{
			curveChannelL = animcurve_get_channel(_animationCurve, "left");
			curveChannelR = animcurve_get_channel(_animationCurve, "right");
		}
		
		#endregion set curve channels
		
		#region motor fix for Windows 8.1 and below
		
		if (os_type == os_windows && os_version < 655360) //windows 8.1 or less
		{
			strengthR = (strengthL + strengthR) / 2;
			strengthL = 0;
			
			timerIncrementR = (timerIncrementL + timerIncrementR) / 2;
			timerIncrementL = 0;
		}
		
		#endregion motor fix for Windows 8.1 and below
	}
}

/// @description force stop vibration for the specified device (default device 0)
/// @param [device]
function VibrateStop() {
    var _device = ((argument_count > 0) && (argument[0] != undefined))? argument[0] : 0;
	with (obj_vibration)
	{
		if (device == _device)
			instance_destroy(id);
	}
}

/// @description force stop vibration for all devices
function VibrateStopAll() {
	instance_destroy(obj_vibration);
}