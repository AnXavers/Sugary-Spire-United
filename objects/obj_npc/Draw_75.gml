var old = draw_get_font();
var wave_x = wave(-5, 5, 5, 20);
draw_set_font(font);
var msg = text;
var textheight = string_height_scribble_ext("[spr_npcfont]" + text, 800);
var total_lines = floor(textheight / 32);
var my_height = (total_lines + 1) * 32;
var tgty = max(my_height, 128);
trace(textheight, "|", string_height(msg), "|", my_height, "|", tgty);
var active = speaking;
draw_set_font(old);
draw_sprite_ext(spr_npcrope, propdex, wave_x + 64, boxy - 15, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_npcrope, propdex, wave_x + 864, boxy - 15, 1, 1, 0, c_white, 1);
var drawing = true;
boxy = max(boxy, -tgty);
if (active)
{
	if (boxstate == 0)
	{
		boxvsp += 0.35;
		boxy = approach(boxy, 50, boxvsp);
		if (boxy >= 50)
			boxstate = 1;
	}
	else
		boxy = lerp(boxy, 30 + wave(-2, 2, 4, 0), 0.2);
}
else
{
	boxstate = 0;
	boxvsp = 0;
	boxy = approach(boxy, -tgty, 5);
	if (boxy <= -tgty)
		drawing = false;
}
if (!drawing)
{
	if (surface_exists(mysurf))
		surface_free(mysurf);
	if (surface_exists(mycut))
		surface_free(mycut);
	exit;
}
if (!surface_exists(mysurf))
	mysurf = surface_create(960, tgty);
if (!surface_exists(mycut))
	mycut = surface_create(960, tgty);
trace(surface_get_height(mysurf));
if (surface_exists(mycut))
{
	surface_set_target(mycut);
	draw_set_color(c_white);
	draw_rectangle(-960, -540, 1920, 1080, false);
	gpu_set_blendmode(3);
	draw_sprite_ext(spr_npcbubble, 1, 480, 0, 9, tgty / sprite_get_height(spr_npcbubble), 0, c_white, 1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
if (surface_exists(mysurf))
{
	surface_set_target(mysurf);
	draw_set_color(c_white);
	draw_sprite_tiled(mytex, 0, mytex_x, mytex_y);
	gpu_set_blendmode(3);
	draw_surface(mycut, 0, 0);
	gpu_set_blendmode(bm_normal);
	draw_sprite_ext(spr_npcbubble, 0, surface_get_width(mysurf) / 2, 0, 9, tgty / sprite_get_height(spr_npcbubble), 0, c_white, 1);
	surface_reset_target();
	draw_surface(mysurf, 0 + wave_x, boxy);
}
draw_set_halign(0);
draw_set_valign(0);
draw_set_color(c_black);
draw_text_scribble_ext(wave_x + 80, boxy + 16, "[wave][spr_npcfont]" + text, 800);
draw_set_color(c_white);
