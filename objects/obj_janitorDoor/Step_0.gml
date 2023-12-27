with (obj_player)
{
	if (place_meeting(x, y, other.id) && key_up && grounded == 1 && (state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.door && state != states.victory && state != states.comingoutdoor)
	{
		if (ds_list_find_index(global.saveroom, other.id) != -1 && global.gamemode != 1)
		{
			mach2 = 0;
			image_index = 0;
			obj_camera.chargecamera = 0;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			state = states.door;
			global.roomsave = 0;
		}
		else if ((global.janitorRudefollow) && (ds_list_find_index(global.saveroom, other.id) == -1))
		{
			scr_sound(sfx_unlockingdoor);
			with (other)
			{
				ds_list_add(global.saveroom, id);
				image_index = 1;
			}
			instance_create(x, y, obj_lock);
			global.roomsave = 0;
			if global.gamemode == 1
			{
				scr_sound(sound_treasuregot);
				scr_queue_tvanim(obj_tv.happytvspr, 200);
				global.collect += 3000;
				global.pizzameter += 5;
				create_small_number(x, y, "3000");
				global.combofreeze = 30;
				global.combotime = 60;
				global.treasure = 1;
				repeat (15)
					instance_create(((x + random_range(-60, 60)) - 16), ((y + random_range(-60, 60)) - 16), obj_collecteffect)
				with (obj_tv)
				{
					scr_controlprompt("[spr_promptfont]Treasure collected!", -4, 150);
					showtext = 1;
					alarm[0] = 150;
				}
			}
			else
			{
				state = states.victory;
				obj_camera.chargecamera = 0;
				targetDoor = other.targetDoor;
				targetRoom = other.targetRoom;
			}
		}
	}
}
