if (place_meeting(x, y, obj_player) && ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	visited = 1;
}
if (ds_list_find_index(global.saveroom, id) != -1)
{
	sprite_index = spr_doorvisited;
	visited = 1;
}
with (instance_place(x, y, obj_doortrigger_parent))
	other.targetDoor = id_door;
TrueVisible = visible;
visible = true;
