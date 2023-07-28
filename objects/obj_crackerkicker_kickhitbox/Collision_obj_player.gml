with (other.id)
{
	if ((instance_exists(other.baddieID) && (state != 96 && (state != 88 && state != 97))) && state != 98)
	{
		state = 96;
		xscale = other.baddieID.image_xscale;
		movespeed = 10;
		vsp = 0;
		sprite_index = spr_tumble;
	}
}
