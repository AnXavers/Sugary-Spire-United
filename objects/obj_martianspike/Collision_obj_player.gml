if (global.martian_alarmed == 1)
{
	with (other)
	{
		if (scr_hurtplayer(id))
		{
			var will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y);
			var _target_xscale = will_goleft ? -1 : 1;
			if (xscale == _target_xscale)
				sprite_index = spr_hurtjump;
			else
				sprite_index = spr_pizzelle_hurt;
			xscale = _target_xscale;
		}
	}
}
