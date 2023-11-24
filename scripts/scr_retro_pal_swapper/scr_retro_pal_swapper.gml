function pal_swap_init_system(argument0, argument1, argument2)
{
	var _swapper = 
	{
		shader: -4,
		html5: false,
		html5_sprite: -4,
		html5_surface: -4,
		texel_size: [0],
		uvs: [0],
		index: [0],
		texture: [0],
		layer_priority: 0,
		layer_temp_priority: 0,
		layer_map: 0,
		cleanup: function()
		{
			ds_priority_destroy(layer_priority);
			ds_priority_destroy(layer_temp_priority);
			ds_map_destroy(layer_map);
		}
	};
	_swapper.html5 = false;
	if (!_swapper.html5)
	{
		_swapper.shader = argument0;
		_swapper.texel_size[0] = shader_get_uniform(argument0, "u_pixelSize");
		_swapper.uvs[0] = shader_get_uniform(argument0, "u_Uvs");
		_swapper.index[0] = shader_get_uniform(argument0, "u_paletteId");
		_swapper.texture[0] = shader_get_sampler_index(argument0, "u_palTexture");
	}
	else
	{
		if (argument1 == undefined || argument2 == undefined)
		{
			show_message("Must provide pal_swap_init_system() with 2 additional arguments for HTML5 Compatible Sprite and Surface Shaders");
			game_end();
		}
		_swapper.html5_sprite = argument1;
		_swapper.html5_surface = argument2;
		_swapper.texel_size[1] = shader_get_uniform(argument1, "u_pixelSize");
		_swapper.uvs[1] = shader_get_uniform(argument1, "u_Uvs");
		_swapper.index[1] = shader_get_uniform(argument1, "u_paletteId");
		_swapper.texture[1] = shader_get_sampler_index(argument1, "u_palTexture");
		_swapper.texel_size[2] = shader_get_uniform(argument2, "u_pixelSize");
		_swapper.uvs[2] = shader_get_uniform(argument2, "u_Uvs");
		_swapper.index[2] = shader_get_uniform(argument2, "u_paletteId");
		_swapper.texture[2] = shader_get_sampler_index(argument2, "u_palTexture");
	}
	_swapper.layer_priority = ds_priority_create();
	_swapper.layer_temp_priority = ds_priority_create();
	_swapper.layer_map = ds_map_create();
	global.retro_pal_swapper = _swapper;
}
function pal_swap_set(argument0, argument1, argument2)
{
	var _swapper = global.retro_pal_swapper;
	if (argument1 == 0)
		exit;
	var _mode = 0;
	if (!argument2)
	{
		if (_swapper.html5)
		{
			shader_set(_swapper.html5_sprite);
			_mode = 1;
		}
		else
			shader_set(_swapper.shader);
		var _tex = sprite_get_texture(argument0, 0);
		var _UVs = sprite_get_uvs(argument0, 0);
		texture_set_stage(_swapper.texture[_mode], _tex);
		var _texel_x = texture_get_texel_width(_tex);
		var _texel_y = texture_get_texel_height(_tex);
		var _texel_hx = _texel_x * 0.5;
		var _texel_hy = _texel_y * 0.5;
		shader_set_uniform_f(_swapper.texel_size[_mode], _texel_x, _texel_y);
		shader_set_uniform_f(_swapper.uvs[_mode], _UVs[0] + _texel_hx, _UVs[1] + _texel_hy, _UVs[2], _UVs[3]);
		shader_set_uniform_f(_swapper.index[_mode], argument1);
	}
	else
	{
		if (_swapper.html5)
		{
			shader_set(_swapper.html5_surface);
			_mode = 2;
		}
		else
			shader_set(_swapper.shader);
		_tex = surface_get_texture(argument0);
		texture_set_stage(_swapper.texture[_mode], _tex);
		_texel_x = texture_get_texel_width(_tex);
		_texel_y = texture_get_texel_height(_tex);
		_texel_hx = _texel_x * 0.5;
		_texel_hy = _texel_y * 0.5;
		shader_set_uniform_f(_swapper.texel_size[_mode], _texel_x, _texel_y);
		shader_set_uniform_f(_swapper.uvs[_mode], _texel_hx, _texel_hy, 1 + _texel_hx, 1 + _texel_hy);
		shader_set_uniform_f(_swapper.index[_mode], argument1);
	}
}
function pal_swap_reset()
{
	if (shader_current() != -1)
		shader_reset();
}
function pal_swap_layer_init()
{
	ds_map_clear(global.retro_pal_swapper.layer_map);
	ds_priority_clear(global.retro_pal_swapper.layer_priority);
	ds_priority_clear(global.retro_pal_swapper.layer_temp_priority);
}
function pal_swap_set_layer(argument0, argument1, argument2, argument3)
{
	var _data = ds_map_find_value(global.retro_pal_swapper.layer_map, argument2);
	if (_data == undefined)
		exit;
	ds_map_set(global.retro_pal_swapper.layer_map, argument2, 
	{
		sprite: argument0,
		index: argument1,
		is_surf: argument3
	});
}
function pal_swap_enable_layer(argument0)
{
	if (!layer_exists(argument0))
		exit;
	var _data = 
	{
		sprite: undefined,
		index: undefined,
		is_surf: undefined
	};
	layer_script_begin(argument0, function()
	{
		if (event_type == 8)
		{
			var _id = ds_priority_delete_min(global.retro_pal_swapper.layer_priority);
			var _data = ds_map_find_value(global.retro_pal_swapper.layer_map, _id);
			if (_data == "<undefined>")
				exit;
			pal_swap_set(_data.sprite, _data.index, _data.is_surf);
			ds_priority_add(global.retro_pal_swapper.layer_temp_priority, _id, layer_get_depth(_id));
		}
	});
	layer_script_end(argument0, function()
	{
		if (event_type == 8)
		{
			pal_swap_reset();
			if (ds_priority_empty(global.retro_pal_swapper.layer_priority))
			{
				ds_priority_copy(global.retro_pal_swapper.layer_priority, global.retro_pal_swapper.layer_temp_priority);
				ds_priority_clear(global.retro_pal_swapper.layer_temp_priority);
			}
		}
	});
	ds_map_set(global.retro_pal_swapper.layer_map, argument0, _data);
	ds_priority_add(global.retro_pal_swapper.layer_priority, argument0, layer_get_depth(argument0));
}
