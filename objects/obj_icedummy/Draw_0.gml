draw_sprite(spr_iceplacebg, 0, x, y);
var objspr = obj_player.costumeBlockDetails[3];
if (!surface_exists(contentsurf))
	contentsurf = surface_create(64, 64);
surface_set_target(contentsurf);
var xpos = 32 - ((sprite_get_width(objspr) / 2) - sprite_get_xoffset(objspr));
var ypos = 32 - ((sprite_get_height(objspr) / 2) - sprite_get_yoffset(objspr));
shader_set(shd_afterimage);
var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
shader_set_uniform_f(colorblend1, 0, 0.7490196078431373, 0.9529411764705882);
var colorblend2 = shader_get_uniform(shd_afterimage, "blendcolor2");
shader_set_uniform_f(colorblend2, 0, 0, 0);
if (objspr != -1)
	draw_sprite(objspr, 0, xpos, ypos);
shader_reset();
surface_reset_target();
if (surface_exists(contentsurf))
	draw_surface(contentsurf, x - 32, y - 32);
draw_set_font(font_console);
draw_set_color(c_white);
draw_self();
