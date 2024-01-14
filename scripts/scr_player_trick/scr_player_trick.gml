function state_player_trick()
{
	hsp = movespeed * xscale;
	sprite_index = spr_trick;
	if (key_sprint && ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles)) && (character == "P" || character == "N"))
	{
		verticalMovespeed = movespeed;
		if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
			verticalMovespeed -= vsp;
		grabclimbbuffer = 0;
		state = 11;
	}
	else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		var _ledge = 0;
		_ledge -= slope_check_up(x + xscale, y, 32);
		_ledge += slope_check_down(x + xscale, y, 3);
		if (_ledge != 0)
			y += _ledge;
		else if (_ledge <= 0)
		{
			state = states.bump;
			image_index = 0;
			sprite_index = spr_splat;
		}
	}
	if (grounded)
	{
		scr_sound(sound_rollgetup);
		image_index = 0;
		sprite_index = spr_rollgetup;
		state = states.mach3;
	}
	image_speed = 0.5;
	if (image_index >= 11 && image_index < 12)
		image_speed = 0;
	do_taunt()
}
