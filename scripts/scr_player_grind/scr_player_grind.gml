function state_player_grind()
{
	vsp = 0;
	sprite_index = spr_grindrail;
	image_speed = 0.35;
	machhitAnim = 0;
	crouchslideAnim = 1;
	hsp = xscale * movespeed;
	if (movespeed < 10)
		movespeed = approach(movespeed, 10, 0.5);
	if (!place_meeting(x, y + 18, obj_grindRail) && !place_meeting(x, y + 18, obj_grindRail_Slope))
	{
		if (movespeed < 12)
		{
			state = 69;
			sprite_index = spr_mach2jump;
		}
		else
		{
			state = 70;
			sprite_index = spr_mach3jump;
		}
	}
	if (place_meeting_collision(x + xscale, y, 1))
	{
		state = 72;
		hsp = -xscale * 5;
		vsp = 1;
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
		scr_sound(sound_bump);
	}
	if (key_jump)
	{
		vsp = -11;
		jumpstop = 0;
		if (movespeed < 12)
		{
			state = 69;
			sprite_index = spr_mach2jump;
		}
		else
		{
			state = 70;
			sprite_index = spr_mach3jump;
		}
	}
	if (!instance_exists(obj_grindeffect))
		instance_create(x, y, 373, 
		{
			playerID: id
		});
}
