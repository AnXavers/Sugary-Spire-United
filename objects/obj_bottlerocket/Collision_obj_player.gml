if (visible)
{
	with (obj_player)
	{
		if (state != states.bottlerocket)
		{
			x = other.x;
			y = other.y;
			substate = substates.unknown_0;
			state = states.bottlerocket;
			xscale = other.image_xscale;
			image_index = 0;
			sprite_index = spr_bottlerocketstart;
			scr_sound(sfx_sodaopen);
		}
	}
}
