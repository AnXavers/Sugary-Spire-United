with (other.id)
{
	global.combofreeze = 30;
	x = other.x;
	y = other.y + (other.sprite_height - 46);
	if (!instance_exists(obj_fadeout))
	{
		if (other.ResetSaveroom == 1)
		{
			global.collect = 0;
			ds_list_clear(global.saveroom);
			ds_list_clear(global.baddieroom);
		}
		scr_sound(sound_door);
		obj_player.targetDoor = other.targetDoor;
		obj_player.targetRoom = other.targetRoom;
		obj_player.hallway = 1;
		obj_player.hallwaydirection = sign(other.image_xscale);
		obj_player.x = obj_player.x;
		obj_player.y = obj_player.y;
		other.visited = 1;
		image_index = 0;
		instance_create(x, y, obj_fadeout);
	}
}
