if (sprite_index == spr_donutShitter && ds_list_find_index(global.saveroom, id) == -1)
{
	image_index = 0;
	sprite_index = spr_donutShitterEating;
	global.combofreeze = 30;
	global.combotime += 15;
	ds_list_add(global.saveroom, id);
	instance_destroy(other.id);
}
