#region //BG Sprite
	pal_swap_set(rankpal, paltime, 0);
	draw_sprite_tiled_ext(bgspr, bgdex, bgx, bgy, 1, 1, c_white, totalalpha);	
	shader_reset();
#endregion
#region //clipboard
	draw_sprite_ext(spr_rankclipboard, 0, 716, 271 + clipy, 1, 1, 0, c_white, 1);	
#endregion
#region Speedrun Timer
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
	draw_set_halign(fa_left);
	draw_set_font(global.smallfont);
	draw_text(823, 512, string_hash_to_newline(((string(global.playhour) + string(tinyish) + string(global.playminutes) + string(tiny)) + string(global.playseconds) + string(tinier) + string(global.playmiliseconds))));
#endregion
#region //Highest Combo
var i = 0
var _string = round(string(global.highestcombo)), _string_length = string_length(_string);
draw_set_font(global.rankcombofont)
draw_set_alpha(totalalpha)
draw_set_halign(fa_center);
for (var i = 0; i < _string_length; i++) 
		{
			var _xx = 850 + (-(string_width(_string) / 2) + ((30 * i)))
			var _yyoffset = (i % 2 == 0 ? -4 : 0)
			draw_text(_xx, 105 + clipy, string_char_at(_string,i + 1));
			shader_reset();
		}
#endregion
#region //secrets
	//draw_sprite_ext(spr_rankcloud, 1, 591, 289, 1, 1, 0, c_white, totalalpha)
	draw_sprite_ext(card1spr, carddex1, 649 + (cshake1 ? irandom_range(-2, 2) : 0), 325 + (cshake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
	draw_sprite_ext(card2spr, carddex2, 723 + (cshake2 ? irandom_range(-2, 2) : 0), 325 + (cshake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
	draw_sprite_ext(card3spr, carddex3, 798 + (cshake3 ? irandom_range(-2, 2) : 0), 327 + (cshake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
#endregion
#region //janitor icon
	//draw_sprite_ext(spr_rankcloud, 1, 591, 289, 1, 1, 0, c_white, totalalpha)
	if jandraw = 1
	draw_sprite_ext(janspr, 0, 558, 88 + clipy, janscale, janscale, 0, c_white, 1)
#endregion
#region //confecti
	//missing confecti
	//draw_sprite(spr_rankribbon, 1, 496, 234)
	draw_sprite_ext(mallowspr, mallowdex, 514 + (shake1 ? irandom_range(-2, 2) : 0), 190 + (shake1 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(chocospr, chocodex, 594 + (shake2 ? irandom_range(-2, 2) : 0), 186 + (shake2 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(crackspr, crackdex, 677 + (shake3 ? irandom_range(-2, 2) : 0), 187 + (shake3 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(wormspr, wormdex, 754 + (shake4 ? irandom_range(-2, 2) : 0), 195 + (shake4 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(candyspr, candydex, 828 + (shake5 ? irandom_range(-2, 2) : 0), 199 + (shake5 ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1);
	//confecti sprites
	if drawmallow == true {} //draw_sprite_ext(spr_confecti1rank, 1, 521, 206, 1 + scale1, 1 + scale1, 0, c_white, 1);
	if drawchoco == true {} //draw_sprite_ext(spr_confecti2rank, 1, 601, 202, 1 + scale2, 1 + scale2, 0, c_white, 1);
	if drawcrack == true {} //draw_sprite_ext(spr_confecti3rank, 1, 684, 203, 1 + scale3, 1 + scale3, 0, c_white, 1);
	if drawworm == true {} //draw_sprite_ext(spr_confecti4rank, 1, 761, 211, 1 + scale4, 1 + scale4, 0, c_white, 1);
	if drawcandy == true {} //draw_sprite_ext(spr_confecti5rank, 1, 835, 215, 1 + scale5, 1 + scale5, 0, c_white, 1);
#endregion
#region //points
	draw_sprite_ext(spr_rankcake, cakedex, 499 + (pshake ? irandom_range(-2, 2) : 0), 430 + (pshake ? irandom_range(-2, 2) : 0) + clipy, 1, 1, 0, c_white, 1)
	var i = 0
	var _string = round(string(countpoint)), _string_length = string_length(_string); //D3G: Holy shit I'm an idiot I've been using string width lmao no wonder it keeps crashing
		if collected != _string
		{
			for (var i = 0; i < _string_length; i++)  //D3G: Idk what is happening anymore
			{
				colors[i] = choose(0,1,2,3,4,5,6)
			}
			collected = _string
		}
	var pal = colors[i];
	draw_set_font(global.candlefont)
	draw_set_alpha(1)
	draw_set_halign(fa_center);
	for (var i = 0; i < _string_length; i++) 
		{
			var _xx = ((pshake ? irandom_range(-2, 2) : 0) + 750) + (-(string_width(_string)/ 2) + ((string_width(_string)/_string_length) * i)), _yy = (pshake ? irandom_range(-2, 2) : 0) + 385, pal = colors[i];
			var _yyoffset = (i % 2 == 0 ? -4 : 0)
			pal_swap_set(spr_palcandle,pal,false);
			draw_text(_xx, _yy + _yyoffset + clipy, string_char_at(_string,i + 1));
			shader_reset();
		}
#endregion
#region //rank
	//draw_sprite_ext(spr_rank, 0, 725, 108, 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_rankletter, rankdex, 725, 108 + clipy, rscale, rscale, 0, c_white, 1)
	if stampani = 1 draw_sprite_ext(spr_rankstamp, stampdex, 480, 270 + clipy, 1, 1, 0, c_white, 1)
#endregion
#region //Player
	pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
	shader_reset();
#endregion
#region //Hat Message
	if hatappear = true
		draw_sprite_ext(spr_playerhats, hatdex, 560, 138 + clipy, 2, 2, 0, c_white, 1);	
#endregion
