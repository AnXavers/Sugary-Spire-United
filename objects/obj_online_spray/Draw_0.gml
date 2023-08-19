if (objectID && sprite_exists(sprite_index))
{
    event_inherited()
    var x_factor = (100 / sprite_width)
    var y_factor = (100 / sprite_height)
    var width = (sprite_width * x_factor)
    var height = (sprite_height * y_factor)
    draw_sprite_ext(sprite_index, image_index, (x - (width / 2)), (y - (height / 2)), x_factor, y_factor, image_angle, image_blend, image_alpha)
    var nametag = (objectID == obj_player ? obj_online_manager.local_name_text : objectID.name_text)
    if nametag
    {
        draw_set_font(nametag.font)
        draw_set_halign(nametag.xorigin)
        draw_set_valign(nametag.yorigin)
        if (nametag.textcolor == c_black && nametag.special)
        {
            var c1 = make_colour_hsv(abs((cos(nametag.rainbow_c) * 255)), 255, 255)
            var c2 = make_colour_hsv(abs((sin(nametag.rainbow_c) * 255)), 255, 255)
            draw_text_color(x, ((y - (height / 2)) - 15), nametag.text, c2, c1, c1, c2, 1)
        }
        else
            draw_text_color(x, ((y - (height / 2)) - 15), nametag.text, nametag.textcolor, nametag.textcolor, nametag.textcolor, nametag.textcolor, 1)
    }
}
