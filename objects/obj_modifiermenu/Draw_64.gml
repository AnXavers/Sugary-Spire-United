if !surface_exists(surface)
{
	surface = surface_create(global.cam_w, global.cam_h);
	surface_set_target(surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}
surface_set_target(surface);
draw_circle((global.cam_w / 2), (global.cam_h / 2), fadeinrad, false)
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_tiled(bg_options, 0, bgTileX, bgTileY);
gpu_set_colorwriteenable(true, true, true, true);
surface_reset_target();
draw_surface(surface, 0, 0)
draw_set_alpha(clamp((txtalpha / 60), 0, 1))
draw_set_font(global.smallfont);
draw_set_halign(fa_left);
draw_text(100, 100, "raghh")