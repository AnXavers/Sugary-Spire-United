draw_set_font(global.promptfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_alpha(bgalpha);
draw_sprite_tiled(bg_titlescreen, 0, bg_scroll, bg_scroll);
var _borderwave = wave(-4, 4, 4, 0, )
draw_sprite(spr_titlescreenborder, 0, _borderwave, _borderwave)
draw_sprite_ext(spr_titlescreenborder, 0, global.cam_w - _borderwave, _borderwave, -1, 1, 0, c_white, bgalpha)
draw_sprite_ext(spr_titlescreenborder, 0, global.cam_w - _borderwave, global.cam_h - _borderwave, -1, -1, 0 ,c_white, bgalpha)
draw_sprite(spr_titlescreenesc, 0, 0, global.cam_h - _borderwave)
draw_sprite(spr_judgementrank, 0, 250, ((global.cam_h / 2) - 45) + wave(-6, 6, 4, 0, current_time + 600))
draw_text(250, ((global.cam_h / 2) + 45) + wave(-6, 6, 4, 0), "No Judgement");
draw_set_alpha(1);
draw_sprite(sprfile[selected], floor(drawindex), filecoords[selected][0], filecoords[selected][1]);
draw_text(xi, yi, string_hash_to_newline(_message));
