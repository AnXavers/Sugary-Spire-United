with (other)
{
	vsp = approach(vsp, -6, 6);
	jumpstop = 1;
	if (state == states.machslide)
	{
		state = states.normal;
		sprite_index = obj_player.spr_outofcontrolfall;
		image_index = 0;
	}
}
