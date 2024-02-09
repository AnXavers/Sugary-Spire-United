function state_player_costumegrab()
{
	move = key_left + key_right;
	sprite_index = spr_costume_hodl;
	hsp = movespeed;
	var heavy = costumeBlockDetails[0] == 2;
	var realmvsp = abs(movespeed);
	if (movespeed != 0)
		xscale = sign(movespeed);
	if (grounded)
		jumpstop = 0;
	movespeed = approach(movespeed, move * 6, 0.8 / (heavy + 1));
	if (key_jump && grounded)
		vsp = (heavy == 1 ? -8 : -10);
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if costumeBlock != -4
	{
		if (key_attack2)
		{
			with self.costumeBlock
			{
				state = icestate.thrown;
				x = other.x;
				y = other.y - 50;
				xscale = other.xscale;
				if (details[0] == 2)
					movespeed = 8 + (realmvsp / 2);
				else
					movespeed = 8 + realmvsp;
				vsp = -1;
			}
			sprite_index = spr_pizzelle_idle;
			costumeBlock = -4;
			costumeBlockDetails = -4;
			state = states.costumenormal;
		}
		if key_down2
		{
			with self.costumeBlock
			{
				state = icestate.thrown;
				if (!scr_solid(other.x + (other.xscale * 75), y, false))
					x = other.x + (other.xscale * 75);
				else
				{
					x = other.x;
					y = other.y;
				}
				xscale = other.xscale;
				movespeed = 0.2;
				vsp = 1;
			}
			sprite_index = spr_pizzelle_idle;
			costumeBlock = -4;
			costumeBlockDetails = -4;
			dummyBlock = -4;
			state = states.costumenormal;
		}
	}
}
