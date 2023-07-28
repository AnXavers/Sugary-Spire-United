condition = function()
{
	return !instance_exists(inst_9EC3D86E);
};
output = function()
{
	with (inst_0DF108AD)
	{
		if (!(ds_list_find_index(global.saveroom, id) != -1))
		{
			instance_create(x, y, obj_cloudeffect);
			repeat (3)
				instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
			instance_destroy();
		}
	}
	with (inst_92A47615)
	{
		if (!(ds_list_find_index(global.saveroom, id) != -1))
		{
			instance_create(x, y, obj_cloudeffect);
			repeat (3)
				instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
			instance_destroy();
		}
	}
	with (inst_96E0ABFF)
	{
		if (!(ds_list_find_index(global.saveroom, id) != -1))
		{
			instance_create(x, y, obj_cloudeffect);
			repeat (3)
				instance_create((x + random_range(-5, 5)), (y + random_range(-5, 5)), obj_cloudeffect)
			instance_destroy();
		}
	}
};
