function scr_painterNEW()
{
	function scr_paintercheapshot()
	{
		if (animation_end() && sprite_index == spr_painter_draw_painting)
			instance_create(x, y, obj_paintercheapshot);
		invincible = true;
		image_speed = 0.35;
		sprite_index = spr_painter_draw_painting;
	}
}
