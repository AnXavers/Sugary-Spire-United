for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with (b)
	{
		if (visible)
		{
			if (color_choose != 0)
			{
				shader_set(shd_afterimage);
				var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
				var colorblend2 = shader_get_uniform(shd_afterimage, "blendcolor2");
				shader_set_uniform_f(colorblend1, color_get_red(obj_afterimagecontroller.color_arr[color_choose].light) / 255, color_get_green(obj_afterimagecontroller.color_arr[color_choose].light) / 255, color_get_blue(obj_afterimagecontroller.color_arr[color_choose].light) / 255);
				shader_set_uniform_f(colorblend2, color_get_red(obj_afterimagecontroller.color_arr[color_choose].dark) / 255, color_get_green(obj_afterimagecontroller.color_arr[color_choose].dark) / 255, color_get_blue(obj_afterimagecontroller.color_arr[color_choose].dark) / 255);
			}
			else if (instance_exists(obj_player))
				scr_palette_as_player();
			else if (spr_palette != -4 && paletteselect != -4)
				pal_swap_set(spr_palette, paletteselect, false);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, image_angle, c_white, gonealpha * image_alpha);
			pal_swap_reset();
		}
	}
}
