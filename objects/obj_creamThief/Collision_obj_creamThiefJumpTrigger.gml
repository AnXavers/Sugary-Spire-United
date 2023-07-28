if (state == 1 && grounded)
{
	if ((other.jumpLeft && image_xscale < 0) || (other.jumpRight && image_xscale > 0))
	{
		vsp = other.jumpPower;
		image_index = 0;
		sprite_index = spr_creamthief_jump;
	}
}
