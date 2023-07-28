function state_player_costumenormal()
{
	sprite_index = spr_costume_idle;
	move = key_left + key_right;
	hsp = movespeed;
	if (substate != 2)
	{
		if (grounded)
		{
			substate = 0;
			jumpstop = 0;
		}
		if (movespeed != 0)
			xscale = sign(movespeed);
		movespeed = approach(movespeed, move * 8, 0.8);
		if (key_jump)
		{
			if (grounded)
				vsp = -12;
			else if (substate == 0)
			{
				vsp = -8;
				substate = 1;
			}
		}
		if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
		{
			vsp /= 20;
			jumpstop = 1;
		}
		if (key_shoot2)
		{
			state = 131;
			breezecooldown = 25;
			instance_create(x, y, obj_breezehitbox);
			movespeed = 12 * xscale;
			if (!grounded)
				vsp = -6;
		}
		chuckcooldown = approach(chuckcooldown, 120, 1);
		if (key_attack && chuckcooldown >= 30)
		{
			if (move != 0)
				xscale = move;
			state = 132;
			sprite_index = spr_player_swingding;
		}
		if (key_slap2 && grounded && place_meeting(x, y + 64, obj_iceblock))
		{
			substate = 2;
			costumegrabdelay = 15;
			with (instance_place(x, y + 82, obj_iceblock))
				hsp = 0;
			vsp = 0;
		}
	}
	if (substate == 2)
	{
		hsp = 0;
		vsp = 0;
		costumegrabdelay--;
		with (instance_place(x, y + 64, obj_iceblock))
		{
			shake = 1;
			hsp = 0;
			vsp = 0;
		}
		if (costumegrabdelay <= 0)
		{
			with (instance_place(x, y + 64, obj_iceblock))
			{
				state = icestate.grabbed;
				other.costumeBlockDetails = details;
				other.costumeBlock = id;
				shake = 0;
			}
			state = 130;
			substate = 0;
			sprite_index = spr_grab;
		}
	}
}
