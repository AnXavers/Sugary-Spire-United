if (pray_delay == 0)
{
	sprite_index = spr_cultist_pray;
	pray_delay = 3;
	with (other)
	{
		if (!is_undefined(scr_transformationCheck(state)))
		{
			scr_sound(sfx_cottongone);
			scr_sound(sound_losetransformation);
			state = states.normal;
			if (key_sprint)
			{
				if (abs(movespeed < 10))
					movespeed = 10;
				else
					movespeed = abs(movespeed);
				state = states.mach2;
			}
			sprite_index = spr_pizzelle_idle;
			instance_create(x, y, obj_poofeffect);
			image_index = 0;
			if (other.canCollect == 1 && ds_list_find_index(global.saveroom, id) == -1)
			{
				ds_list_add(global.saveroom, id);
				repeat (10)
					instance_create((x + (64 + random_range(48, -48))), (y + (32 + random_range(48, -48))), obj_collecteffect)
				global.collect += 500;
				global.combotime = 60;
				other.canCollect = false;
			}
		}
	}
	if (devilboy == 0)
	{
		instance_create(x, y, obj_devilboy);
		devilboy = true;
	}
}
