with (other)
{
	if (state != states.noclip && state != states.fling && !global.freezeframe && vsp >= 0 && !instance_exists(obj_backtostart))
	{
		sprite_index = obj_player.spr_drown;
		state = states.drown;
		vsp = -5;
	}
}