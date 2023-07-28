var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var c = view_camera[0];
if (sucrose_lighting || dance_lighting)
{
	if (sucrose_lighting && !surface_exists(sucrose_surface))
	{
		sucrose_surface = surface_create(cam_width, cam_height);
		surface_set_target(sucrose_surface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	if (sucrose_lighting && surface_exists(sucrose_surface))
	{
		surface_set_target(sucrose_surface);
		draw_clear_alpha(0, 0);
		for (var i = 0; i < array_length(sucrose_color_array); i++)
		{
			with (sucrose_color_array[i])
			{
				if (visible && bbox_in_camera_ext(c, 32))
					draw_sprite_ext_flash(sprite_index, image_index, x - cam_x, y - cam_y, image_xscale, image_yscale, image_angle, other.sucrose_color, image_alpha);
			}
		}
		with (obj_player)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, image_index, x - cam_x, y - cam_y, xscale * scale, yscale * scale, draw_angle, other.sucrose_color, image_alpha);
		}
		with (obj_baddie)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, image_index, draw_x - cam_x, draw_y - cam_y, draw_xscale, draw_yscale, image_angle, other.sucrose_color, image_alpha);
		}
		with (obj_creamThief)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, image_index, x - cam_x, y - cam_y, image_xscale, image_yscale, image_angle, other.sucrose_color, image_alpha);
		}
		with (obj_baddieDead)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, -1, drawx - cam_x, drawy - cam_y, image_xscale, image_yscale, image_angle, other.sucrose_color, image_alpha);
		}
		draw_set_blend_mode(3);
		with (obj_lightsource)
			draw_sprite_ext(sprite_index, image_index, x - cam_x, y - cam_y, 1, 1, 0, c_white, 1);
		with (obj_bombexplosion)
		{
			var set = abs((image_index / image_number) - 1);
			draw_sprite_ext(spr_lightsource_fade, image_index, x - cam_x, y - cam_y, set, set, 0, c_black, set * 2);
		}
		draw_set_blend_mode(0);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(sucrose_surface, cam_x, cam_y);
	}
}
if (instance_exists(obj_bosscontroller) && instance_exists(par_boss) && boss_radius <= 300 && obj_bosscontroller.showing_versus == 0)
{
	if (!surface_exists(boss_surface))
	{
		boss_surface = surface_create(cam_width, cam_height);
		surface_set_target(boss_surface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	if (surface_exists(boss_surface))
	{
		surface_set_target(boss_surface);
		draw_clear_alpha(0, 0.6);
		with (par_boss)
		{
			if (state != bossstates.intro)
			{
				other.boss_radius += other.radius_increase;
				other.radius_increase++;
			}
			gpu_set_blendmode(3);
			draw_circle_color(x, y, other.boss_radius, 0, 0, 0);
			gpu_set_blendmode(0);
		}
		surface_reset_target();
		draw_surface(boss_surface, cam_x, cam_y);
	}
}
