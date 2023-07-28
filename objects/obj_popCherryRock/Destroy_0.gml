if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x + (sprite_width / 2), y + (sprite_height / 4), obj_bombexplosionharmful);
	ds_list_add(global.saveroom, id);
}
