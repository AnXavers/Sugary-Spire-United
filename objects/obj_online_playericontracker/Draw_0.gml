if objectID.visible
{
    event_inherited()
    if objectID
    {
        var nametag = objectID.name_text
        draw_set_font(nametag.font)
        draw_set_halign(nametag.xorigin)
        draw_set_valign(nametag.yorigin)
        if (nametag.textcolor == c_black && nametag.special)
        {
            var c1 = make_colour_hsv(abs((cos(nametag.rainbow_c) * 255)), 255, 255)
            var c2 = make_colour_hsv(abs((sin(nametag.rainbow_c) * 255)), 255, 255)
            draw_text_color(x, ((y - 25) + yoffset), nametag.text, c2, c1, c1, c2, 1)
        }
        else
            draw_text_color(x, ((y - 25) + yoffset), nametag.text, nametag.textcolor, nametag.textcolor, nametag.textcolor, nametag.textcolor, 1)
    }
}
