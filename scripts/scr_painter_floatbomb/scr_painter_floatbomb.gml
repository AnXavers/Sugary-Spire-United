function scr_painter_floatbomb()
{
	var spd = 0.35;
	spd += (intensity * 0.075);
	image_speed = spd;
	vsp = 0;
	movespeed = 0;
	hsp = approach(hsp, 0, 0.15);
	var _x = wave(tgtPos, tgtNeg, 8, 10);
	var _y = wave(-20, 20, 5, 10);
	if (sprite_index == spr_painter_idle)
	{
		sprite_index = spr_painter_paintballcharge;
		image_index = 0;
		xscale = face_center_room();
	}
	if (sprite_index == spr_painter_paintballcharge)
	{
		y = approach(y, 100 + _y, 5);
		x = approach(x, _x, 5);
		intensity--;
		if (intensity <= 0)
		{
			instance_create(x, y, obj_painterbomb);
			intensity = max_intensity;
		}
	}
}
