var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var c = view_camera[0];
if (sucrose_lighting || bloodsauce_lighting || dance_lighting || stormy_lighting)
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
		gpu_set_blendmode(3);
		with (obj_lightsource)
			draw_sprite_ext(sprite_index, image_index, x - cam_x, y - cam_y, 1, 1, 0, c_white, 1);
		with (obj_bombexplosion)
		{
			var set = abs((image_index / image_number) - 1);
			draw_sprite_ext(spr_lightsource_fade, image_index, x - cam_x, y - cam_y, set, set, 0, c_black, set * 2);
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(sucrose_surface, cam_x, cam_y);
	}
	if (bloodsauce_lighting && !surface_exists(bloodsauce_surface))
	{
		bloodsauce_surface = surface_create(cam_width, cam_height);
		surface_set_target(bloodsauce_surface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	if (bloodsauce_lighting && surface_exists(bloodsauce_surface))
	{
		surface_set_target(bloodsauce_surface);
		draw_clear_alpha(0, 0);
		for (var i = 0; i < array_length(bloodsauce_color_array); i++)
		{
			with (bloodsauce_color_array[i])
			{
				if (visible && bbox_in_camera_ext(c, 32))
					draw_sprite_ext_flash(sprite_index, image_index, x - cam_x, y - cam_y, image_xscale, image_yscale, image_angle, other.bloodsauce_color, image_alpha);
			}
		}
		with (obj_player)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, image_index, x - cam_x, y - cam_y, xscale * scale, yscale * scale, draw_angle, other.bloodsauce_color, image_alpha);
		}
		with (obj_baddie)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, image_index, draw_x - cam_x, draw_y - cam_y, draw_xscale, draw_yscale, image_angle, other.bloodsauce_color, image_alpha);
		}
		with (obj_creamThief)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, image_index, x - cam_x, y - cam_y, image_xscale, image_yscale, image_angle, other.bloodsauce_color, image_alpha);
		}
		with (obj_baddieDead)
		{
			if (visible && bbox_in_camera_ext(c, 32))
				draw_sprite_ext_flash(sprite_index, -1, drawx - cam_x, drawy - cam_y, image_xscale, image_yscale, image_angle, other.bloodsauce_color, image_alpha);
		}
		gpu_set_blendmode(3);
		with (obj_lightsource)
			draw_sprite_ext(sprite_index, image_index, x - cam_x, y - cam_y, image_xscale, image_yscale, 0, c_white, 1);
		with (obj_bombexplosion)
		{
			var set = abs((image_index / image_number) - 1);
			draw_sprite_ext(spr_lightsource_fade, image_index, x - cam_x, y - cam_y, set, set, 0, c_black, set * 2);
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(bloodsauce_surface, cam_x, cam_y);
	}
	if (stormy_lighting && !surface_exists(stormy_surface))
	{
		stormy_surface = surface_create(cam_width, cam_height);
		surface_set_target(stormy_surface);
		draw_clear_alpha(0, 0);
		surface_reset_target();
	}
	if (stormy_lighting && surface_exists(stormy_surface))
	{
		surface_set_target(stormy_surface);
		draw_clear(c_black);
		gpu_set_blendmode(3);
		with (obj_player)
		{
			draw_set_alpha(0.5)
			draw_circle_color(x - cam_x + random_range(-1, 1), y - cam_y + random_range(-1, 1), 240, c_white, c_white, false)
			draw_circle_color(x - cam_x + random_range(-1, 1), y - cam_y + random_range(-1, 1), 180, c_white, c_white, false)
			draw_set_alpha(1)
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(0.75);
		surface_reset_target();
		draw_surface(stormy_surface, cam_x, cam_y);
		draw_set_alpha(1);
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
			gpu_set_blendmode(bm_normal);
		}
		surface_reset_target();
		draw_surface(boss_surface, cam_x, cam_y);
	}
}
