function scr_palette_as_player(argument0 = sprite_index, argument1 = image_index, argument2 = -1)
{
	if (instance_exists(obj_player) && argument2 == -1)
	{
		with (obj_player)
		{
			var my_color_array = my_palettes[paletteselect][2];
			var using_pattern = (sprite_exists(my_color_array[2]) && my_palettes[paletteselect][1]);
		}
		if (surface_exists(obj_player.my_pal_surface) && !using_pattern)
			pal_swap_set(obj_player.my_pal_surface, 1, true);
	}
	if (using_pattern && sprite_exists(argument0))
	{
		var s_pat = shader_get_sampler_index(shd_pattern, "s_Pattern");
		var tex = sprite_get_texture(my_color_array[2], 0);
		var tex2 = sprite_get_texture(argument0, argument1);
		shader_set(shd_pattern);
		texture_set_stage(s_pat, tex);
		var mask_color = 4259839;
		var u_mask = shader_get_uniform(shd_pattern, "u_MaskColour");
		var u_spr = shader_get_uniform(shd_pattern, "u_SprRect");
		var u_pat = shader_get_uniform(shd_pattern, "u_PatRect");
		var u_texel = shader_get_uniform(shd_pattern, "u_TexelScl");
		var u_offset = shader_get_uniform(shd_pattern, "u_SprOffset");
		shader_set_uniform_f(u_mask, color_get_red(mask_color), color_get_green(mask_color), color_get_blue(mask_color));
		var uvs = sprite_get_uvs(argument0, argument1);
		shader_set_uniform_f(u_spr, uvs[0], uvs[1], uvs[2], uvs[3]);
		shader_set_uniform_f(u_offset, uvs[4] - sprite_get_xoffset(argument0), uvs[5] - sprite_get_yoffset(argument0));
		uvs = sprite_get_uvs(my_color_array[2], 0);
		shader_set_uniform_f(u_pat, uvs[0], uvs[1], uvs[2], uvs[3]);
		shader_set_uniform_f(u_texel, texture_get_texel_width(tex), texture_get_texel_height(tex), texture_get_texel_width(tex2), texture_get_texel_height(tex2));
	}
}
function new_palette(argument0, argument1, argument2, argument3, argument4 = 8628991, argument5 = 14496, argument6 = 13773959, argument7 = 9988216, argument8 = 0, argument9 = c_white, argument10 = c_red, argument11 = $FFDC00, argument12 = $1070D0)
{
	var q = [argument8, argument9, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument10, argument11, argument12];
	array_push(my_palettes, [argument0, argument1, q]);
}
function set_palette(_arraynum, _palname, _ispattern, _clothcol = c_white, _clothshadecol = scribble_rgb_to_bgr($88A8C8), _skincol = scribble_rgb_to_bgr($FFAA83), _skinshadecol = scribble_rgb_to_bgr($A03800), _scootcol = scribble_rgb_to_bgr($872CD2), _scootboostcol = scribble_rgb_to_bgr($786898), _boostoutercol = c_red, _boostinnercol = scribble_rgb_to_bgr($FFDC00), _outlinecol = c_black, _eyecol = c_white, _pizzanoetc = 855491)
{
	var _q = [_outlinecol, _eyecol, _clothcol, _clothshadecol, _skincol, _skinshadecol, _scootcol, _scootboostcol, _boostoutercol, _boostinnercol, _pizzanoetc];
	my_palettes[_arraynum] = [_palname, _ispattern, _q]
}

