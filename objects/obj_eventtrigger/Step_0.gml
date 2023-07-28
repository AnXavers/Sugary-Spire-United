if (condition != -4 && condition())
{
	if (activated == 0 || flags.do_once == 0)
	{
		output();
		if (flags.do_save == 1 && ds_list_find_index(flags.saveroom, id) == -1)
			ds_list_add(flags.saveroom, id);
		activated = true;
	}
}
else if (reverse_output != -4 && condition != -4 && !condition())
{
	if (activated == 1 || flags.do_once == 0)
	{
		reverse_output();
		activated = false;
	}
}
if (activated == 1 && flags.do_once == 1)
	instance_destroy();
