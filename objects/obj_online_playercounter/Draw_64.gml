if vis
{
    draw_set_font(global.old_smallfont)
    draw_set_halign(fa_right)
    draw_set_valign(fa_bottom)
    var a = 1
    var b = c_lime
    if (!obj_online_manager.connected)
        b = 255
    draw_text_color((display_get_gui_width() / 6), (obj_screensizer.actual_height - 8), ("Players Online: " + string(instance_number(obj_online_player))), b, b, b, b, a)
}
