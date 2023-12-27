if (sprite_index != spr_exitgateclosed)
{
	with (other)
	{
		if (key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor)
		{
			global.levelname = other.level;
			scr_levelstart(global.levelname, other.targetRoom);
			ini_open(global.fileselect);
			var ranks = ini_read_string("Ranks", string(global.levelname), "none");
			ini_close();
			global.showplaytimer = ranks != "none";
			mach2 = 0;
			obj_camera.chargecamera = 0;
			image_index = 0;
			sprite_index = spr_entergate;
			state = states.victory;
			targetDoor = other.targetDoor;
			targetRoom = other.targetRoom;
			ds_queue_clear(global.newhudmessage);
			audio_stop_all();
		}
		if (sprite_index == spr_entergate && !instance_exists(obj_modifiermenu))
		{
			global.entergateroom = room
			global.entergateid = instance_nearest(x, y, obj_startgate).id
			if keyboard_check_pressed(vk_escape)
			{
				instance_create(x, y, obj_modifiermenu)
			}
			else if (animation_end() || keyboard_check_pressed(vk_enter))
			{
				modifierinitiate();
				if (!instance_exists(obj_titlecard) && other.do_titlecard)
				{
					with (instance_create(x, y, obj_titlecard))
						info = instance_nearest(x, y, obj_startgate).info;
				}
				else if (!instance_exists(obj_fadeout) && !other.do_titlecard)
				{
					instance_create(x, y, obj_fadeout);
					obj_tv.tvsprite = spr_tvturnon;
					obj_tv.image_index = 0;
				}
			}
		}
	}
}