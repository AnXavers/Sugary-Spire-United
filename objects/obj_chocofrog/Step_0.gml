with (instance_nearest(x, y, obj_player))
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
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.rupertnormal || state == states.rupertjump || state == states.rupertslide))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && (state == states.rupertjump || state == states.rupertslide))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.bottlerocket && substate == states.frozen))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.barrelcrouch && substate == states.frozen))
	{
		with (other.id)
			instance_destroy();
	}
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.ufodashOLD && sprite_index == spr_pizzelleuforoll))
	{
		with (other.id)
			instance_destroy();
	}
}
if (place_meeting(x, y, obj_bombexplosionconeboy) && instance_place(x, y, obj_bombexplosionconeboy).frog)
	instance_destroy();
with (instance_nearest(x, y, obj_minedummycart))
{
	if (place_meeting(x + hsp, y, other.id) || place_meeting(x + sign(hsp), y, other.id))
	{
		with (other.id)
			instance_destroy();
	}
}
