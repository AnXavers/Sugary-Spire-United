function state_player_costumechuck()
{
	if (substate == 0)
	{
		chuckcooldown--;
		move = key_left + key_right;
		hsp = movespeed;
		movespeed = approach(movespeed, move * 15, 1.4);
		if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
		{
			substate = substates.unknown_1;
			hsp = -2.5 * xscale;
			vsp = -3;
			sprite_index = spr_mach3hitwall;
			image_index = 0;
		}
		if (chuckcooldown == 0 || !key_sprint)
			state = states.costumenormal;
	}
	if (substate == 1)
	{
		if (animation_end())
			state = states.costumenormal;
	}
}
