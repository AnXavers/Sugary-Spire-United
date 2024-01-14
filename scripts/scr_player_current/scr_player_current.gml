function state_player_current()
{
	move = key_left + key_right;
	hsp = movespeed;
	if (grounded)
	{
		substate = substates.unknown_0;
		jumpstop = 0;
	}
	if (movespeed != 0)
		xscale = sign(movespeed);
	movespeed = approach(movespeed, move * 10, 0.5);
	if (key_jump)
	{
		if (grounded)
			vsp = -12;
	}
	if (key_attack2 && key_down && !grounded && check == 0)
	{
		check = 1;
		vsp = -12;
	}
	if (grounded)
		check = 0;
	if (place_meeting(x, y, obj_dancenote) && key_attack2)
	{
		if (instance_nearest(x, y, obj_dancenote).active == 1)
		{
			with (instance_nearest(x, y, obj_dancenote))
				active = 0;
		}
		vsp = -12;
		movespeed += (2 * xscale);
	}
	if ((place_meeting(x + hsp, y, obj_speaker) || place_meeting(x + xscale, y, obj_speaker)) || (place_meeting(x, y - 1, obj_speaker) && key_attack2))
	{
		with (instance_nearest(x, y, obj_speaker))
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, obj_baddie) || place_meeting(x + xscale, y, obj_baddie)) && key_attack2)
	{
		with (instance_nearest(x, y, obj_baddie))
			instance_destroy();
	}
	sprite_index = spr_player_grabkick;
}
