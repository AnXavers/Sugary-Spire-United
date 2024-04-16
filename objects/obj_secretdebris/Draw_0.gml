if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]) - 64, camera_get_view_y(view_camera[0]) - 64, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 64, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 64))
{
	if (!surface_exists(s))
	{
		s = surface_create(sprite_width, sprite_height);
		surface_set_target(s);
		draw_clear_alpha(c_white, 0);
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(sprite_index, image_index, sprite_xoffset, sprite_yoffset, image_xscale, image_yscale, 0, image_blend, image_alpha);
		gpu_set_blendmode_ext(bm_dest_color, bm_inv_src_alpha);
		if (mode == 1)
		{
			for (var i = -1; i < 2; i++)
			{
				for (var z = -1; z < 2; z++)
					draw_tile(tile_dataset, tile_dataid, 0, 0 + (32 * i), 0 + (32 * z));
			}
		}
		else
			draw_sprite_tiled(blendsprite, 0, 0, 0);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
	if (surface_exists(s))
	{
		var sprite_diagonal = sqrt((sprite_height * sprite_height) + (sprite_width * sprite_width));
		var dir = point_direction(x, y, x - sprite_get_xoffset(sprite_index), y - sprite_get_yoffset(sprite_index));
		var drawx = (x - sprite_xoffset) + lengthdir_x(sprite_diagonal / 2, image_angle + dir);
		var drawy = (y - sprite_yoffset) + lengthdir_y(sprite_diagonal / 2, image_angle + dir);
		draw_surface_ext(s, drawx + sprite_get_xoffset(sprite_index), drawy + sprite_get_yoffset(sprite_index), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
}
