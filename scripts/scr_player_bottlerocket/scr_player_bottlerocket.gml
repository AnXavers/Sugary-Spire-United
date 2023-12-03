function state_player_bottlerocket()
{
	image_speed = 0.35;
	move = key_left + key_right;
	move2 = key_up - key_down;
	if (substate == 1)
	{
		movespeed = approach(movespeed, 0, 0.5);
		hsp = xscale * movespeed;
		if (!grounded)
			substate = substates.unknown_0;
		if (movespeed <= 0)
		{
			xscale *= -1;
			substate = substates.unknown_0;
			sprite_index = spr_bottlerocket_grounded;
			movespeed = 12;
		}
	}
	if (substate == 0)
	{
		if (sprite_index != spr_bottlerocketstart)
		{
			hsp = xscale * movespeed;
			vsp = move2 * -5;
			if (grounded)
				sprite_index = spr_bottlerocket_grounded;
			else
				sprite_index = spr_player_bottlerocket;
			if (move == xscale)
				movespeed = approach(movespeed, 24, 0.1);
			else if (move == -xscale)
			{
				if (grounded)
				{
					substate = substates.unknown_1;
					sprite_index = spr_bottlerocket_turn;
					image_index = 0;
				}
				else
					movespeed = approach(movespeed, 8, 0.2);
			}
			else
				movespeed = approach(movespeed, 12, 0.2);
			if (key_jump)
			{
				state = states.mach2;
				if character == "M"
					state = states.mach3
				vsp = -15;
				image_index = 0;
				sprite_index = spr_mach2jump;
				if (!instance_exists(obj_rocketdud))
					instance_create(x, y, obj_rocketdud);
			}
		}
		else
		{
			movespeed = 0;
			hsp = 0;
			vsp = 0;
			if (animation_end())
			{
				movespeed = 12;
				image_speed = 0.35;
				sprite_index = spr_player_bottlerocket;
				var myButton1 = get_control_string(global.key_jump);
				var myButton2 = get_control_string(global.key_left) + get_control_string(global.key_right);
				scr_controlprompt("[spr_buttonfont]" + myButton1 + "[spr_promptfont] Jump Off  [spr_buttonfont]" + myButton2 + "[spr_promptfont] Turn (While Grounded)");
			}
		}
		if (scr_solid(x + xscale, y, true) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_chocofrog))
		{
			instance_create(x, y, obj_bombexplosionharmless);
			vsp = -6;
			movespeed /= 2;
			xscale *= -1;
			mach2 = 0;
			grounded = 0;
			sprite_index = spr_slipnslidestart;
			state = states.puddle;
		}
	}
}
