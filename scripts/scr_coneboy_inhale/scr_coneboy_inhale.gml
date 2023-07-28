function scr_coneboy_inhale()
{
	move = key_left + key_right;
	if (substate == 0)
	{
		hsp = approach(hsp, 0, 1);
		vsp = 0;
		if (!inhaling)
			inhaling = true;
		sprite_index = spr_coneboy_inhaling;
		if (!key_attack || inhalingenemy == 1)
		{
			state = 1;
			inhaling = false;
		}
		inhalestrength = gamepad_button_value(0, 32775) * 20;
		camera_shake(inhalestrength, 20);
		p1Vibration(inhalestrength + 1, 20);
	}
	if (substate == 1)
	{
		hsp = xscale * movespeed;
		movespeed = 10;
		sprite_index = spr_coneboy_sworddash;
		if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
		{
			vsp = -6;
			movespeed = -6;
			sprite_index = spr_player_mach3hitwall;
			state = 72;
		}
	}
	if (substate == 2)
	{
		hsp = xscale * movespeed;
		if (!key_attack)
		{
			state = 1;
			sprite_index = spr_coneboy_idle;
		}
		if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
		{
			vsp /= 20;
			jumpstop = 1;
		}
		if (key_jump)
			vsp = -9;
		if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
		{
			if (!grounded)
			{
				sprite_index = spr_coneboy_juicewallclimb;
				state = 11;
				verticalMovespeed = max(3, -vsp);
			}
			else
			{
				vsp = -6;
				movespeed = -6;
				sprite_index = spr_player_mach3hitwall;
				state = 72;
			}
		}
		if (move == xscale)
			movespeed += 0.1;
	}
}
