if (other.state != 110 && sprite_index == spr_lappingportal_idle && global.panic)
{
	with (other)
	{
		x = other.x;
		y = other.y;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		image_index = 0;
		sprite_index = spr_lappingportal_enter;
	}
	ds_list_add(global.saveroom, id);
	cutscene_create([cutscene_lapPortal_start, cutscene_lapPortal_middle, cutscene_lapPortal_end]);
	instance_destroy();
}
