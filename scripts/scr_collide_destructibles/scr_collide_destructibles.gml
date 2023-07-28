function scr_collide_destructibles()
{
	if (state == 68)
	{
		if (place_meeting(x + xscale, y, obj_destructibles))
		{
			with (instance_place(x + xscale, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			instance_create(x, y, obj_bumpeffect);
			hsp = -xscale * 4;
			vsp = -4;
			machpunchAnim = true;
			image_index = 0;
			sprite_index = spr_canehit;
			state = 57;
		}
	}
	if (state == 69 || state == 58 || state == 148 || state == 150 || state == 149 || state == 39 || state == 127 || state == 109 || (state == 133 && substate == 0) || state == 70 || state == 139 || state == 31 || (state == 88 && (sprite_index == spr_cotton_attack || movespeed >= 8)) || state == 103 || state == 3 || state == 19 || state == 67 || state == 89 || state == 93 || state == 95 || state == 96 || state == 105 || state == 77 || state == 62 || state == 104 || state == 121 || state == 101 || state == 125 || state == 140 || state == 142 || state == 106 || state == 119 || state == 120 || state == 107 || state == 83)
	{
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == 69)
				machpunchAnim = true;
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == 69)
				machpunchAnim = true;
		}
		if (place_meeting(x + xscale, y, obj_destructibles))
		{
			with (instance_place(x + xscale, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == 69)
				machpunchAnim = true;
		}
	}
	if ((state == 31 && vsp > 0) || state == 109 || (state == 67 && vsp > 0))
	{
		if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 49)
	{
		if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 88 || state == 98)
	{
		if (sprite_index == spr_cotton_attack || state == 98)
		{
			if (place_meeting(x + sign(hsp) + xscale, y, obj_destructibles))
			{
				with (instance_place(x + sign(hsp) + xscale, y, obj_destructibles))
				{
					DestroyedBy = other.id;
					event_user(0);
				}
			}
		}
	}
	if ((state == 19 || state == 103 || state == 36 || state == 95 || state == 3) && vsp >= 0)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 12)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 97 || state == 119 || (state == 133 && substate == 2))
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + 1, obj_destructibles))
		{
			with (instance_place(x, y + 1, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if ((state == 11 || state == 141) && vsp < 0)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 109)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x, y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (vsp >= 0 && (state == 95 || state == 150 || state == 36 || (state == 74 || state == 75)))
	{
		if ((place_meeting(x, y + vsp, obj_metalblock) && state == 95) || (state == 150 && sprite_index == spr_player_skatespin) || (state == 36 && freefallsmash >= 10) || ((state == 74 || state == 75) && freefallsmash >= 10))
		{
			with (instance_place(x, y + vsp, obj_metalblock))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if ((place_meeting(x, y + sign(vsp), obj_metalblock) && state == 95) || (state == 150 && sprite_index == spr_player_skatespin) || (state == 36 && freefallsmash >= 10) || ((state == 74 || state == 75) && freefallsmash >= 10))
		{
			with (instance_place(x, y + sign(vsp), obj_metalblock))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x, y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 60 || state == 63 || state == 69 || state == 70 || state == 105 || state == 119 || state == 120)
	{
		if (place_meeting(x, y + vsp, obj_destructibles) && vsp < 0)
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y - 1, obj_destructibles))
		{
			with (instance_place(x, y - 1, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 89 && vsp < 0)
	{
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	if (state == 17)
	{
		with (obj_destroyable3_hard)
		{
			if (place_meeting(x - other.hsp, y, other))
			{
				with (other)
				{
					hsp = -xscale * 4;
					vsp = -4;
					mach2 = 0;
					image_index = 0;
					sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7);
					state = 57;
				}
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		with (obj_destructibles)
		{
			if (place_meeting(x - obj_player.hsp, y, obj_player))
			{
				var _player = instance_nearest(x, y, obj_player);
				DestroyedBy = _player;
				event_user(0);
			}
		}
	}
	with (obj_baddie)
	{
		if (place_meeting(x + hsp, y, obj_destructibles) && thrown == 1)
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles) && thrown == 1)
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + vsp, obj_destructibles) && thrown == 1)
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + sign(vsp), obj_destructibles) && thrown == 1)
		{
			with (instance_place(x, y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + hsp, y + vsp, obj_destructibles) && thrown == 1)
		{
			with (instance_place(x + hsp, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles) && thrown == 1)
		{
			with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	with (obj_train)
	{
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	with (obj_creamThief)
	{
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	with (par_donut)
	{
		if (place_meeting(x + hsp, y + vsp, obj_destructibles))
		{
			with (instance_place(x + hsp, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x, y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
	with (obj_minedummycart)
	{
		if (place_meeting(x + hsp, y + vsp, obj_destructibles))
		{
			with (instance_place(x + hsp, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + vsp, obj_destructibles))
		{
			with (instance_place(x, y + vsp, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if (place_meeting(x, y + sign(vsp), obj_destructibles))
		{
			with (instance_place(x, y + sign(vsp), obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
	}
}
