pal_swap_set(rankpal, bgdex, 0);
if (goup)
	afterimagesetup();
draw_sprite_tiled_ext(bgspr, bgdex, bgx, bgy, 1, 1, c_white, totalalpha);
shader_reset();
scr_palette_as_player();
if (goup)
{
	afterimagesetup();
	if (sprite_index == obj_player.spr_player_rankP)
		draw_rectangle(0, 0, 960, 540, false);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
pal_swap_reset();
draw_set_alpha(flash);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
draw_sprite_ext(spr_rankclipboard, 0, 716, 271 + clipy, 1, 1, 0, c_white, 1);
var i = 0;
var _string = round(string(global.highestcombo));
var _string_length = string_length(_string);
draw_set_font(global.rankcombofont);
draw_set_alpha(totalalpha);
draw_set_halign(fa_center);
for (i = 0; i < _string_length; i++)
{
	var _xx = 850 + (-(string_width(_string) / 2) + (30 * i));
	var _yyoffset = ((i % 2) == 0) ? -4 : 0;
	draw_text(_xx, 105 + clipy, string_char_at(_string, i + 1));
	shader_reset();
}
draw_sprite_ext(card1spr, carddex1, 649 + (cshake1 ? irandom_range(-2, 2) : 0), 325 + (cshake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(card2spr, carddex2, 723 + (cshake2 ? irandom_range(-2, 2) : 0), 325 + (cshake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(card3spr, carddex3, 798 + (cshake3 ? irandom_range(-2, 2) : 0), 327 + (cshake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
if (jandraw == 1)
{
	if lapjanspr = spr_null
		draw_sprite_ext(janspr, 0, 558, 88 + clipy, janscale, janscale, 0, c_white, 1);
	else if janspr = spr_null
		draw_sprite_ext(lapjanspr, 0, 558, 88 + clipy, janscale, janscale, 0, c_white, 1);
	else
	{
		draw_sprite_ext(janspr, 0, 568, 88 + clipy, janscale, janscale, 0, c_white, 1);
		draw_sprite_ext(lapjanspr, 0, 510, 88 + clipy, janscale, janscale, 0, c_white, 1);
	}
}
draw_sprite_ext(obj_player.spr_confecti1_rank, global.mallowfollow, 514 + (shake1 ? irandom_range(-2, 2) : 0), 190 + (shake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(obj_player.spr_confecti2_rank, global.chocofollow, 594 + (shake2 ? irandom_range(-2, 2) : 0), 186 + (shake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(obj_player.spr_confecti3_rank, global.crackfollow, 677 + (shake3 ? irandom_range(-2, 2) : 0), 187 + (shake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(obj_player.spr_confecti4_rank, global.wormfollow, 754 + (shake4 ? irandom_range(-2, 2) : 0), 195 + (shake4 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(obj_player.spr_confecti5_rank, global.candyfollow, 828 + (shake5 ? irandom_range(-2, 2) : 0), 199 + (shake5 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
draw_sprite_ext(obj_player.spr_cakerank, cakedex, 499 + (pshake ? irandom_range(-4, 4) : 0), 430 + (pshake ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
i = 0;
_string = round(string(countpoint));
_string_length = string_length(_string);
if (collected != _string)
{
	for (i = 0; i < _string_length; i++)
		colors[i] = irandom(6);
	collected = _string;
}
var pal = colors[i];
draw_set_font(obj_player.font_collect);
draw_set_alpha(1);
draw_set_halign(fa_center);
for (i = 0; i < _string_length; i++)
{
	_xx = (pshake ? irandom_range(-4, 4) : 0 + 750) + (-(string_width(_string) / 2) + ((string_width(_string) / _string_length) * i));
	var _yy = (pshake ? irandom_range(-4, 4) : 0) + 385;
	pal = colors[i];
	_yyoffset = ((i % 2) == 0) ? -4 : 0;
	pal_swap_set(spr_palcandle, pal, false);
	draw_text(_xx, _yy + _yyoffset + clipy, string_char_at(_string, i + 1));
	shader_reset();
}
if (global.lapcount >= 2)
{
	draw_set_font(global.promptfont);
	draw_text(880, 340 + clipy, global.lapcount)
}
draw_sprite_ext(spr_rankletter, rankdex, 725, 108 + clipy, rscale, rscale, 0, c_white, 1);
if (stampani == 1)
	draw_sprite_ext(spr_rankstamp, stampdex, 480, 270 + clipy, 1, 1, 0, c_white, 1);
var tiny = ":";
var tinier = ":";
var tinyish = ":";
if (global.playseconds < 10)
	tiny = ":0";
if (global.playmiliseconds < 10)
	tinier = ":0";
if (global.playminutes < 10)
	tinyish = ":0";
draw_set_color(c_white);
draw_set_halign(0);
draw_set_font(global.smallfont);
draw_text(823, 512, string_hash_to_newline(string(global.playhour) + string(tinyish) + string(global.playminutes) + string(tiny) + string(global.playseconds) + string(tinier) + string(global.playmiliseconds)));
