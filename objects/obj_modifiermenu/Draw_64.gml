if !surface_exists(surface)
{
	surface = surface_create(global.cam_w, global.cam_h);
	surface_set_target(surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}
surface_set_target(surface);
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(1);
draw_sprite_tiled(bg_pausescreenTile, 0, bgTileX, bgTileY);
draw_set_blend_mode(1);
draw_set_color(c_white)
draw_circle((global.cam_w / 2), (global.cam_h / 2), fadeinrad, false)
draw_set_blend_mode(0);