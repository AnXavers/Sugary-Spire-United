function scr_painter_dash()
{
	image_speed = 0.35;
	hsp = movespeed * xscale;
	if (sprite_index == spr_painter_idle)
	{
		hsp = 0;
		xscale = face_center_room();
		movespeed = 0;
		sprite_index = spr_painter_dashstart;
		image_index = 0;
	}
	if (animation_end() && sprite_index == spr_painter_dashstart)
	{
		movespeed = 13;
		sprite_index = spr_painter_dashstart2;
		image_index = 0;
	}
	if (sprite_index == spr_painter_dash || sprite_index == spr_painter_dashstart2)
	{
		if (animation_end() && sprite_index == spr_painter_dashstart2)
			sprite_index = spr_painter_dash;
		movespeed += 0.1;
		var target_x = tgtNeg;
		if (xscale == 1)
			target_x = tgtPos;
		var dist = point_distance(x, 0, target_x, 0);
		if (dist <= 32 && intensity > 0)
		{
			flash = true;
			image_index = 0;
			sprite_index = spr_painter_turn;
			intensity--;
		}
		if (subattack_1 != -4 && intensity <= 0 && subattack_1 == 1 && dist < 20)
		{
			x = target_x;
			state = bossstates.normal;
			xscale = face_center_room();
			image_index = 0;
			movespeed = 0;
		}
		else if (scr_solid(x + hsp, y, true) && intensity <= 0)
		{
			flash = true;
			state = bossstates.vulnerable;
			intensity = 120;
			delay = 60;
			sprite_index = hurt_spr;
			vsp = -8;
			hsp = -7 * xscale;
		}
	}
	if (sprite_index == spr_painter_turn)
	{
		movespeed = approach(movespeed, 0, 0.5);
		if (movespeed == 0)
		{
			xscale *= -1;
			movespeed = 13;
			flash = true;
			sprite_index = spr_painter_dashstart2;
		}
	}
}
