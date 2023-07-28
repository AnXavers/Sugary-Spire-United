function p1Vibration()
{
	with (obj_gamepadder)
	{
		vibration1 = argument0;
		vibrationDecay1 = argument1;
	}
	gamepad_set_vibration(global.player_input_device, obj_gamepadder.vibration1, obj_gamepadder.vibration1);
}
