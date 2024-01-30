with (obj_player)
{
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.cotton && movespeed >= 8)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.cotton && sprite_index == spr_cotton_attack)
	{
		with (other.id)
			instance_destroy();
	}
		if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.cottonbounce && cottonsize > 3)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.cottonroll)
	{
		with (other.id)
			instance_destroy();
	}
	if (((place_meeting(x, y + vsp, other.id) && vsp > 0) || place_meeting(x, y + 1, other.id)) && state == states.cottondrill)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.minecart)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.fireass)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && state == states.fireass)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == states.hooks)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && state == states.hooks)
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.frostburn || state == states.frostburnspin))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.rupertnormal || state == states.rupertslide || state == states.rupertjump))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && (state == states.rupertslide || state == states.rupertjump))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.bottlerocket && substate == 0))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && ((state == states.cookiemount || state == states.cookiemountattack || state == states.cookiemountfireass) && substate == 0))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.ufodashOLD && sprite_index == spr_pizzelle_uforoll))
	{
		with (other.id)
			instance_destroy();
	}
}
if (place_meeting(x, y, obj_bombexplosionconeboy))
	instance_destroy();
with (instance_nearest(x, y, obj_minedummycart))
{
	if (place_meeting(x + hsp, y, other.id) || place_meeting(x + sign(hsp), y, other.id))
	{
		with (other.id)
			instance_destroy();
	}
}
