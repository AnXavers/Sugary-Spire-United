function scr_collide_destructibles()
{
	 if ((state == states.jump && sprite_index == spr_noise_noisebombspinjump) || (state == states.pogo && pogochargeactive == 1))
	{
		with (instance_place(x, y, obj_destructibles))
		 instance_destroy()
	}
	if (state == states.mach1)
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
			state = states.tackle;
		}
	}
	if (state == states.mach2 || state == states.slipnslide || state = states.punch || state == states.rupertnormal || state == states.rupertjump || state == states.rupertslide || state == states.grind || state == states.trick || state == states.geyser || (state == states.bottlerocket && substate == 0) || state == states.mach3 || state == states.climbceiling || state == states.machroll || (state == states.cotton && (sprite_index == spr_cotton_attack || movespeed >= 8)) || state == states.machtumble || state == 3 || state == 19 || state == states.crouchslide || state == states.uppercut || state == states.parry || state == states.puddle || state == states.tumble || state == states.pizzano_mach || state == states.door || state == states.comingoutdoor || state == states.pizzano_rocketfist || state == states.pizzano_shoulderbash || state == states.minecart || state == states.flushed || state == states.frostburn || state == states.frostburnspin || state == states.pizzano_kungfu || state == states.pizzano_twirl || state == states.pizzano_machtwirl || state == states.pizzano_pummel || state == states.cookiemount || state == states.cookiemountattack || state == states.cookiemountfireass || state == states.pepperman_pinball || (state == states.pogo && pogochargeactive == 1) || state == states.shoulder || (state = states.coneboy_inhale115 && substate != 0))
	{
		if (place_meeting(x + hsp, y, obj_destructibles))
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == states.mach2)
				machpunchAnim = true;
		}
		if (place_meeting(x + sign(hsp), y, obj_destructibles))
		{
			with (instance_place(x + sign(hsp), y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == states.mach2)
				machpunchAnim = true;
		}
		if (place_meeting(x + xscale, y, obj_destructibles))
		{
			with (instance_place(x + xscale, y, obj_destructibles))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
			if (state == states.mach2)
				machpunchAnim = true;
		}
	}
	if ((state == states.machroll && vsp > 0) || state == states.geyser || (state == states.crouchslide && vsp > 0))
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
	if (state == states.ufodash)
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
	if (state == states.cotton || state == states.cottonroll)
	{
		if (sprite_index == spr_cotton_attack || state == states.cottonroll)
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
	if ((state == 19 || state == states.machtumble || state == states.superslam || state == states.puddle || state == 3) && vsp >= 0)
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
	if (state == states.cottondrill || state = states.cottonspring || state == states.pizzano_twirl || (state == states.bottlerocket && substate == 2))
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
	if ((state == 11 || state == states.frostburnwallrun) && vsp < 0)
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
	if (state == states.geyser)
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
	if (vsp >= 0 && (state == states.puddle || state == states.rupertjump || state == states.superslam || (state == states.freefall || state == states.freefallland || state = states.Sjump)))
	{
		if ((place_meeting(x, y + vsp, obj_metalblock) && state == states.puddle) || (state == states.rupertjump && sprite_index == spr_skatespin) || (state == states.superslam && freefallsmash >= 10) || ((state == states.freefall || state == states.freefallland) && freefallsmash >= 10))
		{
			with (instance_place(x, y + vsp, obj_metalblock))
			{
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		if ((place_meeting(x, y + sign(vsp), obj_metalblock) && state == states.puddle) || (state == states.rupertjump && sprite_index == spr_skatespin) || (state == states.superslam && freefallsmash >= 10) || ((state == states.freefall || state == states.freefallland) && freefallsmash >= 10))
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
	if (state == states.jump || state == states.Sjump || state == states.mach2 || state == states.mach3 || state == states.pizzano_mach || state == states.pizzano_twirl || state == states.pizzano_machtwirl || state == states.pepperman_pinball || state == states.shoulder || (state == states.pogo && pogochargeactive == 1))
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
	if (state == states.uppercut && vsp < 0)
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
					sprite_index = choose(spr_blockbreak1, spr_blockbreak2, spr_blockbreak3, spr_blockbreak4, spr_blockbreak5, spr_blockbreak6, spr_blockbreak7);
					state = states.tackle;
				}
				DestroyedBy = other.id;
				event_user(0);
			}
		}
		with (obj_destructibles)
		{
			if (place_meeting(x - obj_player.hsp, y, obj_player))
			{
				DestroyedBy = obj_player;
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
