var c = view_camera[0];
with (obj_baddie)
{
	var dist = 32;
	if (visible && bbox_in_camera_ext(c, dist))
	{
		var _drawx = x;
		var _drawy = y;
		if (tauntBuffer || (global.freezeframe && setfordeath))
		{
			_drawx += irandom_range(-1, 1);
			_drawy += irandom_range(-1, 1);
		}
		var _xs = (abs(image_xscale) + squashvalx) * sign(image_xscale);
		var _ys = image_yscale - squashvalx;
		if (squashedy == 1)
		{
			_xs = image_yscale - squashvaly;
			_ys = (abs(image_xscale) + squashvaly) * sign(image_xscale);
		}
		draw_xscale = _xs;
		draw_yscale = _ys;
		draw_x = _drawx + (46 * squashvaly);
		draw_y = _drawy + (46 * squashvalx);
		if (object_index == obj_pillarenem && state == 8)
			draw_y -= 75;
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);
		if (flash)
			draw_sprite_ext_flash(sprite_index, image_index, draw_x, draw_y, draw_xscale, draw_yscale, image_angle, c_white, image_alpha);
		if (cottoned)
			draw_sprite_ext_flash(sprite_index, image_index, draw_x, draw_y, draw_xscale, draw_yscale, image_angle, 16681727, 0.6);
		pal_swap_reset();
		if (global.debugmode == 1)
		{
			draw_set_font(font_dev);
			draw_text(x, y - 50, state);
			draw_text(x, y - 150, movespeed);
			if (object_index == obj_cottonwitch)
				draw_text(x, y - 100, bombreset);
			if (object_index == obj_sluggy)
			{
				draw_text(x, y - 100, idletimer);
				draw_text(x, y - 150, jumptimer);
			}
			if (object_index == obj_creamtheifOLD)
				draw_text(x, y - 100, snatchcooldown);
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		}
	}
}
with (obj_creamThief)
{
	if (visible && bbox_in_camera_ext(c, 32))
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
with (obj_player)
{
	if (visible && bbox_in_camera_ext(c, 32))
	{
		var my_color_array = my_palettes[paletteselect][2];
		var using_pattern = sprite_exists(my_color_array[2]);
		if (!using_pattern)
		{
			if (!surface_exists(my_pal_surface))
				my_pal_surface = surface_create(sprite_get_width(obj_player.spr_palette), sprite_get_height(obj_player.spr_palette));
			if (!buffer_exists(my_pal_buffer))
			{
				trace("buffer created");
				if (surface_exists(my_pal_surface))
				{
					surface_set_target(my_pal_surface);
					draw_clear_alpha(c_white, 0);
					pal_swap_draw_palette(obj_player.spr_palette, 0, 0, 0);
					pal_swap_draw_palette(obj_player.spr_palette, 1, 1, 0);
					for (var i = 0; i < array_length(my_color_array); i++)
						draw_point_color(1, i, my_color_array[i]);
					surface_reset_target();
				}
				my_pal_buffer = buffer_create(sprite_get_width(obj_player.spr_palette) * sprite_get_height(obj_player.spr_palette) * 4, 0, 1);
				buffer_get_surface(my_pal_buffer, my_pal_surface, 0);
			}
			if (buffer_exists(my_pal_buffer))
				buffer_set_surface(obj_player.my_pal_buffer, obj_player.my_pal_surface, 0);
		}
		var _x_shake = 0;
		var _y_shake = 0;
		if (state == states.bushdisguise && shaketime > 0)
			_x_shake += random_range(shaketime / 12, -shaketime / 12);
		if (global.freezeframe)
		{
			_x_shake = random_range(-6, 6);
			_y_shake = random_range(-6, 6);
		}
		scr_palette_as_player();
		var _remappedspr = spriteremap()
		draw_sprite_ext(_remappedspr, image_index, x + _x_shake, y + _y_shake, xscale * scale, yscale * scale, draw_angle, image_blend, image_alpha);
		pal_swap_reset();
		if (flash)
			draw_sprite_ext_flash(_remappedspr, image_index, x + _x_shake, y + _y_shake, xscale * scale, yscale * scale, draw_angle, c_white, image_alpha);
		if (is_inSecretPortal)
			draw_sprite_ext_flash(_remappedspr, image_index, x + _x_shake, y + _y_shake, xscale * scale, yscale * scale, draw_angle, 9251145, image_alpha * (1.5 - scale));
		if (global.debugmode == 1)
		{
			draw_set_font(font_dev);
			draw_set_halign(fa_center);
			draw_set_color(c_white);
			draw_text(x, y - 50, "State: " + string(state) + "." + string(substate) + ", " + string(stateName));
			draw_text(x, y - 100, movespeed);
			draw_text(x, y - 150, grounded);
			draw_text(x, y - 200, "Can Ladder:" + string(!scr_solid(x, y + 16)));
			draw_text(x, y - 220, angle);
			draw_text(x + 50, y - 220, baddiegrabbedID);
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
			draw_set_halign(0);
		}
	}
}
with (obj_baddieDead)
{
	if (spr_palette != -4)
	{
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(sprite_index, -1, drawx, drawy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		shader_reset();
	}
	else
		draw_sprite_ext(sprite_index, -1, drawx, drawy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
