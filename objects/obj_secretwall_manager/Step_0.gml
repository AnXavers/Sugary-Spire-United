depth = instance_exists(obj_endlevelfade) ? -3 : -34;
var current_hider = obj_player.secret_array;
if (array_length(global.secret_layers) > 0)
{
	for (var i = 0; i < array_length(global.secret_layers); i++)
	{
		if (layer_exists(global.secret_layers[i].nm))
			global.secret_layers[i].alpha = approach(global.secret_layers[i].alpha, array_contains(current_hider, global.secret_layers[i].nm) ? 0 : 1, 0.05);
	}
}
