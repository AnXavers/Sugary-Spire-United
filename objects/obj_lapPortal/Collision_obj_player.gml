if (other.state != 110 && sprite_index == obj_player.spr_lapportal_idle && global.panic && (global.enableportal = 2 || !global.enablejerald))
{
	with (other)
	{
		x = other.x;
		y = other.y;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		image_index = 0;
		sprite_index = obj_player.spr_lapportal_enter;
	}
	with instance_create(x, y, obj_cameraRegion)
	{
		zoom = 0.6
		ClampTop = false
		ClampBottom = false
		ClampLeft = false
		ClampRight = false
	}
	global.maintainzoom = 1;
	scr_sound(sfx_lapenter)
	cutscene_create([cutscene_lapPortal_start, cutscene_lapPortal_middle, cutscene_lapPortal_end]);
	instance_destroy();
}
