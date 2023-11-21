function scr_enemy_theif()
{
	if (theifsubstate == 0)
	{
		hsp = image_xscale * movespeed;
		if (theifkeyinv == 0)
			sprite_index = walkspr;
		if (theifkeyinv == 1)
		{
			sprite_index = spr_theif_keywalk;
			movespeed = 4;
		}
		if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
			image_xscale *= -1;
		if (((obj_player.x > (x - 200) && obj_player.x < (x + 200)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && snatchcooldown == 0 && obj_player.state != states.keyget && theifkeyinv == 0)
		{
			theifsubstate = 2;
			sprite_index = spr_theif_snatch;
			image_index = 0;
			image_xscale = -sign(x - obj_player.x);
		}
	}
	if (theifsubstate == 1)
	{
		movespeed = 0;
		hsp = 0;
		if (animation_end() && sprite_index == spr_theif_keyget)
		{
			sprite_index = spr_theif_keywalk;
			theifsubstate = substates.unknown_0;
			movespeed = 4;
		}
	}
	if (theifsubstate == 2)
	{
		hsp = image_xscale * movespeed;
		movespeed = 5;
		if ((place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope)) || animation_end())
		{
			theifsubstate = substates.unknown_0;
			snatchcooldown = 100;
			movespeed = 2;
		}
		if (place_meeting(x + sign(hsp), y, obj_player) && obj_player.state != states.keyget)
		{
			if (global.key_inv == 0)
			{
				scr_hurtplayer();
				snatchcooldown = 100;
				theifsubstate = substates.unknown_0;
				movespeed = 2;
			}
			if (global.key_inv == 1)
			{
				scr_hurtplayer();
				global.key_inv = 0;
				snatchcooldown = 100;
				theifsubstate = 1;
				theifkeyinv = 1;
				sprite_index = spr_theif_keyget;
			}
		}
	}
	if (snatchcooldown > 0 && theifsubstate != 2)
		snatchcooldown -= 0.2;
}
