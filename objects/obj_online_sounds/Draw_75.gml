if (burst_timeout > 0)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_bottom)
    draw_set_font(global.creditsfont)
    draw_set_color(c_yellow)
    draw_text(16, (obj_screensizer.actual_height - 16), "You're sending a lot of sounds at once!")
}
