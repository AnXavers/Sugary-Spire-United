draw_set_halign(fa_center);
draw_set_font(global.smallfont);
var _pos = current_time / 1000
draw_sprite(bg_options, 0, _pos, _pos)
var _x = global.cam_w / 2
var _s0x = (selected[0] * 100)
var _s1x = (selected[1] * 100)
var _s2x = (selected[2] * 100)
for (var i = 0; i < array_length(global.modoptions); i++)
	draw_text(_x + (i * 100) - _s0x, 50, global.modoptions[i][1])
for (var i = 0; i < array_length(global.modoptions[selected[0]][4]); i++)
	draw_text(_x + (i * 100) - _s1x, 50, global.modoptions[i][1])
for (var i = 0; i < (array_length(global.modoptions[selected[0]][4][selected[1]][4]) - 2); i++)
	draw_text(_x + (i * 100) - _s2x, 50, global.modoptions[i][1])