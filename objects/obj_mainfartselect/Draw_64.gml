draw_set_font(global.promptfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(bgalpha);
draw_sprite_tiled(bg_tutorial1_0, 0, bg_scroll, bg_scroll);
draw_sprite(spr_judgementrank, 0, 250, 225 + wave(-6, 6, 4, 0, current_time + 600))
draw_text(250, 315 + wave(-6, 6, 4, 0), "No Judgement");
draw_set_alpha(1);
draw_sprite(sprfile[selected], floor(drawindex), filecoords[selected][0], filecoords[selected][1]);
draw_text(xi, yi, string_hash_to_newline(_message));
