if (ds_list_find_index(global.saveroom, id) != -1)
{
	with (obj_tvtexttrigger)
	{
		if (trigger == other.trigger)
			can_activate = true;
	}
	instance_destroy();
}
