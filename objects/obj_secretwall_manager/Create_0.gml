depth = -34;
global.secret_layers = [];
if (instance_number(object_index) > 1)
{
	var _first = instance_find(object_index, 0);
	if (id != _first)
	{
		instance_destroy();
		exit;
	}
}
