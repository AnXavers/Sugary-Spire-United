function scr_secrettiles_add()
{
	if (object_index != obj_secretwall)
		return false;
	if (is_undefined(argument[0]))
		return false;
	for (var i = 0; i < argument_count; i++)
	{
		var arg = argument[i];
		var layerid = layer_get_id(arg);
		layer_set_visible(layerid, false);
		array_push(layerArray, layerid);
	}
	var _f = function() {
		return -(layer_get_depth(argument[0]) - layer_get_depth(argument[1]));
	};
	array_sort(layerArray, _f);
	return true;
}
function add_secrettiles()
{
	for (var i = 0; i < array_length(global.secret_layers); i++)
	{
		var a = global.secret_layers[i];
		surface_free(a.surf);
	}
	global.secret_layers = [];
	for (i = 0; i < argument_count; i++)
	{
		arg = argument[i];
		layerid = layer_get_id(arg);
		layer_set_visible(layerid, false);
		var name = layer_get_name(layerid);
		array_push(global.secret_layers, 
		{
			nm: name,
			alpha: 1,
			surf: -4
		});
	};
	var _f = function() {
		return -(layer_get_depth(argument0.nm) - layer_get_depth(argument1.nm));
	};
	array_sort(global.secret_layers, _f);
	return true;
}
