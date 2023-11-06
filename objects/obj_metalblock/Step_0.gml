with (obj_player)
{
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.mach3 || state == states.rupertslide || state == states.puddle || state == states.pizzano_rocketfist || state == states.knightpepslopes || state == states.Nhookshot || (state == states.machroll && sprite_index != spr_crouchslip && movespeed >= 12) || state == states.pizzano_mach || state == states.minecart || (state == states.knightpep && momemtum == 1) || (state == states.bottlerocket && substate == substates.unknown_0)))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && (state == states.climbceiling && movespeed >= 12))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && ((state == states.seacream || state == states.seacreamjump) && abs(movespeed) >= 12))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + 1, other.id)) && (state == states.climbdownwall && verticalMovespeed >= 12))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == states.Sjump)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == states.climbwall && mach2 >= 100)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp >= 0) || place_meeting(x, y + 1, other.id)) && state == states.freefallland && freefallsmash > 10)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
}
with (instance_nearest(x, y, obj_donutShitted))
{
	if (bigShot && (place_meeting(x + hsp, y + vsp, other.id) || place_meeting(x + sign(hsp), y + sign(vsp), other.id)))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
		instance_destroy();
	}
}
with (instance_nearest(x, y, obj_donutSlammable))
{
	if (place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
		instance_destroy();
	}
}
with (instance_nearest(x, y, obj_minedummycart))
{
	if (place_meeting(x + sign(hsp), y, other.id) && place_meeting(x + hsp, y, other.id))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
}
