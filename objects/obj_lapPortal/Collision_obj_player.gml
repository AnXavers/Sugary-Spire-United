if (other.state != 110 && sprite_index == spr_lappingportal_idle && global.panic && (global.enableportal = 2 || !global.enablejerald))
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
	cutscene_create([cutscene_lapPortal_start, cutscene_lapPortal_middle, cutscene_lapPortal_end]);
	instance_destroy();
}
