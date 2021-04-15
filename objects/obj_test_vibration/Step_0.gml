
//fade in
if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu))
	VibrateExtended(1, 1, 200, 200, 0, crv_vibrate_linear_0_to_1);

//fade out
if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd))
	VibrateExtended(1, 1, 200, 200, 0, crv_vibrate_linear_1_to_0);

//pan left
if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl))
	VibrateExtended(1, 1, 200, 200, 0, crv_vibrate_pan_left);

//pan right
if (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr))
	VibrateExtended(1, 1, 200, 200, 0, crv_vibrate_pan_right);
	
//stop vibration
if (keyboard_check_pressed(vk_space) || gamepad_button_check(0, gp_face1) || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_face4))
	VibrateStop();