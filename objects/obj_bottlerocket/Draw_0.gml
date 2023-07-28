if (instance_exists(obj_drawcontroller) && obj_drawcontroller.sucrose_lighting)
	draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, obj_drawcontroller.sucrose_color, image_alpha);
else
	draw_self();
