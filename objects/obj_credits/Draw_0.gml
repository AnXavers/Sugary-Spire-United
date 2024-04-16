DrawX += DrawHspeed;
DrawY += DrawVspeed;
draw_sprite_tiled(sceneBackground, 0, DrawX, DrawY);
if (flash)
{
	gpu_set_fog(true, c_white, 0, 1);
	draw_sprite_tiled(sceneBackground, 0, DrawX, DrawY);
	gpu_set_fog(false, c_black, 0, 0);
}
draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(-64, -64, 1024, 605, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.creditsfont);
draw_text(x, y, creditsText);
