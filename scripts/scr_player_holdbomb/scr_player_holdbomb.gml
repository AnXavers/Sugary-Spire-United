function state_player_holdbomb()
{
	var _bomb = -4;
	if (instance_exists(bombID))
		_bomb = bombID;
	else
	{
		state = 1;
		exit;
	}
	if (substate == 0)
	{
		_bomb.countdown -= 0.5;
		move = key_left + key_right;
		if (dir != xscale)
		{
			dir = xscale;
			movespeed = 2;
			facehurt = 0;
		}
		if (grounded)
		{
			hsp = move * movespeed;
			if (move != 0)
				movespeed = approach(movespeed, 6, 0.5);
			else
				movespeed = 0;
			if (move != 0)
				xscale = move;
		}
		else
		{
			hsp = xscale * movespeed;
			if (move != 0)
				movespeed = approach(movespeed, 6, 0.5);
			else
				movespeed = approach(movespeed, 0, 0.1);
			if (move != 0)
				xscale = move;
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
			{
				vsp /= 20;
				jumpstop = 1;
			}
		}
		if (grounded && key_jump && !key_down && !key_sprint && vsp > 0)
		{
			scr_sound(sound_jump);
			sprite_index = spr_haulingjump;
			instance_create(x, y, obj_highjumpcloud2);
			vsp = -11;
			image_index = 0;
		}
		if (key_attack2 && grounded)
		{
			hsp = 0;
			movespeed = 0;
			vsp = 0;
			substate = substates.unknown_1;
		}
		if (grounded && move != 0)
			sprite_index = spr_haulingwalk;
		else if (grounded && move == 0)
			sprite_index = spr_haulingidle;
		if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
			sprite_index = spr_haulingidle;
		if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) || (!grounded && (sprite_index == spr_haulingwalk || sprite_index == spr_haulingidle)))
			sprite_index = spr_haulingfall;
		if (grounded && vsp > 0 && (sprite_index == spr_haulingfall || sprite_index == spr_haulingjump))
		{
			sprite_index = spr_haulingland;
			movespeed = 2;
		}
		if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
			sprite_index = spr_haulingidle;
	}
	if (substate == 1)
	{
		var angleto = (xscale == -1) ? 180 : 0;
		angle = wave(-70 + angleto, 70 + angleto, 2, 0);
		sprite_index = spr_suplexmash1;
		if (key_jump)
			substate = substates.unknown_0;
	}
}
