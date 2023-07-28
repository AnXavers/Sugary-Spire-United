if ((global.panic == 1 && panicmode == 1) || panicmode == 0)
{
	if (ds_list_find_index(global.saveroom, id) == -1 && can_activate == 1 && activated == 0)
	{
		with (obj_collectablebox)
		{
			if (unid == other.unid)
				alarm[1] = 1;
		}
		with (obj_collectableboxtrigger)
		{
			if (trigger == other.trigger)
				can_activate = true;
		}
		activated = true;
		ds_list_add(global.saveroom, id);
		instance_destroy();
	}
}
