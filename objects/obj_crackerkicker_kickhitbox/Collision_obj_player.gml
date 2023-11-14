with (other.id)
{
	if ((instance_exists(other.baddieID) && (state != states.tumble && (state != states.cotton && state != states.cottondrill))) && state != states.cottonroll)
	{
		state = states.tumble;
		xscale = other.baddieID.image_xscale;
		movespeed = 10;
		vsp = 0;
		sprite_index = spr_tumble;
	}
}
