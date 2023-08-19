if target
    textcolor = target.color
if (global.oldsmallfont_nametag >= 1)
    font = global.old_smallfont
else
    font = global.smallfont
draw_set_font(font)
draw_set_halign(xorigin)
draw_set_valign(yorigin)
var alpha = (((room == boss_pepperman || room == boss_vigilante || room == boss_noise || room == boss_fakepep || room == boss_pizzaface || room == arena_1 || room == cafe_arena) && (!global.online_bosspvp)) ? 0.35 : 1)
if (target && target.object_index != obj_online_player)
    alpha = 1
if (textcolor == c_black && special)
{
    var c1 = make_colour_hsv(abs((cos(rainbow_c) * 255)), 255, 255)
    var c2 = make_colour_hsv(abs((sin(rainbow_c) * 255)), 255, 255)
    rainbow_c += 0.002
    draw_text_color(x, y, text, c2, c1, c1, c2, alpha)
}
else
    draw_text_color(x, y, text, textcolor, textcolor, textcolor, textcolor, alpha)
