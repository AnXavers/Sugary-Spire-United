function scr_painter_lunge()
{
	image_speed = 0.35;
	if (sprite_index == spr_painter_lungestart)
	{
		hsp = approach(hsp, 0.0001, 0.3);
		if (animation_end(7) && hsp != 0)
			hsp = -4 * xscale;
		if (animation_end())
		{
			sprite_index = spr_painter_lungestart2;
			image_index = 0;
			movespeed = 21;
			flash = true;
			if (!instance_exists(obj_painter_lungebox))
				instance_create(x, y, obj_painter_lungebox);
		}
	}
	if (sprite_index == spr_painter_lunge || sprite_index == spr_painter_lungestart2)
	{
		create_afterimage(1, 6);
		if (sprite_index == spr_painter_lungestart2 && animation_end())
			sprite_index = spr_painter_lunge;
		var diff_mvsp = 15 + (intensity * 2);
		var target_x = tgtNeg;
		if (xscale == 1)
			target_x = tgtPos;
		var dist = point_distance(x, 0, target_x, 0);
		var _move = (dist < 200) ? (((dist / 200) * (diff_mvsp * 0.6666666666666666)) + (diff_mvsp * 0.3333333333333333)) : diff_mvsp;
		movespeed = approach(movespeed, _move, 0.7);
		x = approach(x, target_x, movespeed);
		if (dist < 10)
		{
			x = target_x;
			state = bossstates.normal;
			xscale = face_center_room();
			image_index = 0;
			movespeed = 0;
		}
	}
	if (sprite_index == spr_painter_idle)
	{
		image_index = 0;
		sprite_index = spr_painter_lungestart;
		if (!(x <= 320 || x >= 672))
			xscale = face_obj(obj_player);
		else
			xscale = face_center_room();
	}
}
