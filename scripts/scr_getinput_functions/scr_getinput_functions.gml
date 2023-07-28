function scr_getinput()
{
	key_up = false;
	key_up2 = false;
	key_right = false;
	key_right2 = false;
	key_left = false;
	key_left2 = false;
	key_down = false;
	key_down2 = false;
	key_jump = false;
	key_jump2 = false;
	key_jump_release = false;
	key_slap = false;
	key_slap2 = false;
	key_taunt = false;
	key_taunt2 = false;
	key_attack = false;
	key_attack2 = false;
	key_shoot = false;
	key_shoot2 = false;
	key_start = false;
	key_start2 = false;
	key_escape = false;
	stickpressed = false;
	if (global.shellactivate)
		exit;
	if (keyboard_check_pressed(vk_f1))
		scr_resetinput();
	var _dvc = global.player_input_device;
	gamepad_set_axis_deadzone(_dvc, 0.4);
	key_up = keyboard_check(global.key_up) || gamepad_button_check(_dvc, global.key_upC) || gamepad_axis_value(_dvc, gp_axislv) < 0;
	key_up2 = keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(_dvc, global.key_upC) || (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && stickpressed == 0);
	key_right = keyboard_check(global.key_right) || gamepad_button_check(_dvc, global.key_rightC) || gamepad_axis_value(_dvc, gp_axislh) > 0;
	key_right2 = keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(_dvc, global.key_rightC) || (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && stickpressed == 0);
	key_left = -(keyboard_check(global.key_left) || gamepad_button_check(_dvc, global.key_leftC) || gamepad_axis_value(_dvc, gp_axislh) < 0);
	key_left2 = -(keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(_dvc, global.key_leftC) || (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && stickpressed == 0));
	key_down = keyboard_check(global.key_down) || gamepad_button_check(_dvc, global.key_downC) || gamepad_axis_value(_dvc, gp_axislv) > 0;
	key_down2 = keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(_dvc, global.key_downC) || (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && stickpressed == 0);
	key_jump2 = keyboard_check(global.key_jump) || gamepad_button_check(_dvc, global.key_jumpC);
	key_jump = keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(_dvc, global.key_jumpC);
	key_jump_release = keyboard_check_released(global.key_jump) || gamepad_button_check_released(_dvc, global.key_jumpC);
	key_slap = keyboard_check(global.key_slap) || gamepad_button_check(_dvc, global.key_slapC);
	key_slap2 = keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(_dvc, global.key_slapC);
	key_taunt = keyboard_check(global.key_taunt) || gamepad_button_check(_dvc, global.key_tauntC);
	key_taunt2 = keyboard_check_pressed(global.key_taunt) || gamepad_button_check_pressed(_dvc, global.key_tauntC);
	key_attack = keyboard_check(global.key_attack) || gamepad_button_check(_dvc, global.key_attackC) || gamepad_button_check(_dvc, gp_shoulderrb);
	key_attack2 = keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(_dvc, global.key_attackC) || gamepad_button_check_pressed(_dvc, gp_shoulderrb);
	key_shoot = keyboard_check(global.key_shoot) || gamepad_button_check(_dvc, global.key_shootC);
	key_shoot2 = keyboard_check_pressed(global.key_shoot) || gamepad_button_check_pressed(_dvc, global.key_shootC) || gamepad_button_check_pressed(_dvc, gp_shoulderl);
	key_start = keyboard_check(global.key_start) || gamepad_button_check(_dvc, global.key_startC);
	key_start2 = keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(_dvc, global.key_startC);
	key_special = keyboard_check(global.key_special) || gamepad_button_check(_dvc, global.key_specialC);
	key_special2 = keyboard_check_pressed(global.key_special) || gamepad_button_check_pressed(_dvc, global.key_specialC);
	key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select);
	if (gamepad_axis_value(_dvc, gp_axislh) > 0.5 || gamepad_axis_value(_dvc, gp_axislh) < -0.5 || gamepad_axis_value(_dvc, gp_axislv) > 0.5 || gamepad_axis_value(_dvc, gp_axislv) < -0.5)
		stickpressed = true;
	else
		stickpressed = false;
	return true;
}
function scr_keyname(argument0)
{
	if (argument0 == 37)
		return "LEFT";
	if (argument0 == 39)
		return "RIGHT";
	if (argument0 == 38)
		return "UP";
	if (argument0 == 40)
		return "DOWN";
	if (argument0 == 13)
		return "ENTER";
	if (argument0 == 27)
		return "ESCAPE";
	if (argument0 == 32)
		return "SPACE";
	if (argument0 == 16)
		return "SHIFT";
	if (argument0 == 17)
		return "CONTROL";
	if (argument0 == 18)
		return "ALT";
	if (argument0 == 8)
		return "BACKSPACE";
	if (argument0 == 9)
		return "TAB";
	if (argument0 == 36)
		return "HOME";
	if (argument0 == 35)
		return "END";
	if (argument0 == 46)
		return "DELETE";
	if (argument0 == 45)
		return "INSERT";
	if (argument0 == 33)
		return "PAGE UP";
	if (argument0 == 34)
		return "PAGE DOWN";
	if (argument0 == 19)
		return "PAUSE";
	if (argument0 == 44)
		return "PRINTSCREEN";
	if (argument0 == 112)
		return "F1";
	if (argument0 == 113)
		return "F2";
	if (argument0 == 114)
		return "F3";
	if (argument0 == 115)
		return "F4";
	if (argument0 == 116)
		return "F5";
	if (argument0 == 117)
		return "F6";
	if (argument0 == 118)
		return "F7";
	if (argument0 == 119)
		return "F8";
	if (argument0 == 120)
		return "F9";
	if (argument0 == 121)
		return "F10";
	if (argument0 == 122)
		return "F11";
	if (argument0 == 123)
		return "F12";
	if (argument0 == 96)
		return "NUMPAD 0";
	if (argument0 == 97)
		return "NUMPAD 1";
	if (argument0 == 98)
		return "NUMPAD 2";
	if (argument0 == 99)
		return "NUMPAD 3";
	if (argument0 == 100)
		return "NUMPAD 4";
	if (argument0 == 101)
		return "NUMPAD 5";
	if (argument0 == 102)
		return "NUMPAD 6";
	if (argument0 == 103)
		return "NUMPAD 7";
	if (argument0 == 104)
		return "NUMPAD 8";
	if (argument0 == 105)
		return "NUMPAD 9";
	if (argument0 == 106)
		return "MULTIPLY";
	if (argument0 == 111)
		return "DIVIDE";
	if (argument0 == 107)
		return "ADD";
	if (argument0 == 109)
		return "SUBTRACT";
	if (argument0 == 110)
		return "DECIMAL";
	if (argument0 == -1)
		return "PRESS KEY";
	return chr(argument0);
}
