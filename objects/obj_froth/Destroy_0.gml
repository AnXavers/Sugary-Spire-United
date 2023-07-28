if ((ds_list_find_index(global.baddieroom, id) == -1 && inhaleddestroyvar == 0) || (important && inhaleddestroyvar == 0))
	instance_create(x, y, obj_snowpoofeffect);
event_inherited();
