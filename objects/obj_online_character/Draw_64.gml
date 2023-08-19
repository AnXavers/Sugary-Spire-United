if (opacity == 0)
    return "";
var mx = (obj_screensizer.actual_width / 2)
var my = (obj_screensizer.actual_height / 2)
var cx = ((mx - scroll_x) - (grid_size * 4))
var oy = (my + scroll_y)
var cy = oy
var min_x = (-grid_size)
var min_y = (-grid_size)
var max_x = (obj_screensizer.actual_width + grid_size)
var max_y = (obj_screensizer.actual_height + grid_size)
draw_set_alpha((opacity * 0.5))
draw_set_color(c_black)
draw_rectangle(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, false)
draw_set_alpha(1)
shader_set(global.Pal_Shader)
var oldpalettetexture = global.palettetexture
var index = (current_time / 55)
for (var _char = -4; _char < (array_length(characters) + 4); _char++)
{
    var char = _char
    if (char < 0)
        char += array_length(characters)
    if (char >= array_length(characters))
        char -= array_length(characters)
    var ch = characters[char]
    var spr = ch[2]
    var palspr = ch[3]
    cy = oy
    var palcount = (array_length(palettes) + (sprite_get_width(palspr) - default_palette_count))
    for (var pal = 0; pal < palcount; pal++)
    {
        if (cx >= min_x && cx <= max_x && cy >= min_y && cy <= max_y)
        {
            var palindex = 0
            if (pal < array_length(palettes))
            {
                var arr = palettes[pal]
                if (arr[2] == 12)
                    global.palettetexture = arr[3]
                else
                    global.palettetexture = -4
                palindex = arr[2]
            }
            else
            {
                palindex = ((pal - array_length(palettes)) + default_palette_count)
                global.palettetexture = -4
            }
            var dist = (2 - (point_distance(cx, cy, mx, my) / grid_size))
            dist = (clamp(dist, 1, 2) * opacity)
            pattern_set(global.Base_Pattern_Color, spr, index, dist, dist, global.palettetexture)
            pal_swap_set(palspr, palindex, 0)
            draw_sprite_ext(spr, index, cx, cy, dist, dist, 0, c_white, 1)
            pattern_reset()
        }
        cy -= grid_size
    }
    cx += grid_size
}
reset_shader_fix()
global.palettetexture = oldpalettetexture
ch = characters[selected_char]
draw_set_color(c_white)
draw_set_alpha(opacity)
draw_set_font(lang_get_font("bigfont"))
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_text((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height - 64), ch[1])
draw_set_font(global.old_smallfont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
var palname = "Unknown"
if (selected_pal >= array_length(palettes))
    palname = ("Extra Palette " + string(((selected_pal - array_length(palettes)) + 1)))
else
    palname = scr_get_palettename(ch[5], palettes[selected_pal][0])
draw_text((obj_screensizer.actual_width / 2), ((obj_screensizer.actual_height - 64) + 16), palname)
