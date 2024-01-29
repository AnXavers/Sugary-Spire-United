if (place_meeting(x, y - 16, obj_player))
{
	with (obj_player)
	{
		if (place_meeting(x, y + 16, other.id) && !scr_solid(x + xscale, y, true) && bbox_bottom <= other.bbox_top && xscale == sign(other.image_xscale))
		{
			if (state == states.mach2 || state == states.mach3 || state == states.trick)
			{
				state = states.trick;
				vsp = -12;
				movespeed = 14;
			}
			else if (state == states.cookiemount)
			{
				input_buffer = 60;
				vsp = -22;
				movespeed = 22 * obj_player.xscale;
			}
		}
	}
}
