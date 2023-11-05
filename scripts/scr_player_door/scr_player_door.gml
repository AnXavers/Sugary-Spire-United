function state_player_door()
{
	hsp = 0;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	if (sprite_index != spr_downpizzabox && sprite_index != spr_uppizzabox)
		sprite_index = spr_lookdoor;
	if (animation_end())
	{
		image_speed = 0;
		if (!instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade))
		{
			instance_create(x, y, obj_fadeout);
			scr_sound(sound_door);
		}
	}
	if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
	{
		with (instance_place(x, y, par_door))
		{
			other.x = approach(other.x, (x - sprite_xoffset) + (sprite_width / 2), 2);
			other.y = approach(other.y, (y - sprite_yoffset) + (sprite_height / 2), 5);
		}
	}
	global.combofreeze = 30;
}
