with (obj_player)
{
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == states.tumble && sprite_index != spr_tumblestart))
	{
		with (other.id)
			instance_destroy();
	}
}
