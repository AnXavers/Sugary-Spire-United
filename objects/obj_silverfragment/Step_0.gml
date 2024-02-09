event_inherited();
if speaking == true && silveractive == 0
{
	silveractive = 1
	alarm[0] = 10 * room_speed
}
if silveractive == 2
{
	silverindex += approach(silverindex, 1, 0.005)
	var _silverran = silverindex * 2
	x = xorigin + random_range(-_silverran, _silverran)
	y = yorigin + (-silverindex * 50) + random_range(-_silverran, _silverran)
	if silverindex >= 1 && !instance_exists(obj_fadeout)
	{
		obj_player.targetRoom = targetRoom
		obj_player.targetDoor = targetDoor
		instance_create(x, y, obj_fadeout)
		scr_sound(sound_pizzacoin)
		scr_controlprompt("[spr_promptfont]Fragment collected...")
	}
}