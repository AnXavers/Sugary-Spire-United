if (ds_list_find_index(global.baddieroom, id) == -1 && inhaleddestroyvar == 0)
{
	if (debris == 1)
		scr_sound(sfx_glassbreak);
	with (instance_create(x, y, obj_puddle))
	{
		spr_palette = other.spr_palette;
		paletteselect = other.paletteselect;
		vsp = -4;
	}
}
if ((ds_list_find_index(global.baddieroom, id) == -1 || important) && inhaleddestroyvar == 0)
{
	obj_tv.image_index = irandom_range(0, 4);
	repeat (3)
		instance_create(x, y, obj_slapstar);
	instance_create(x, y + 30, obj_bangeffect);
	camera_shake(3, 3);
	if (debris == 1)
	{
		var i = 0;
		repeat (10)
		{
			with (instance_create(x, y, obj_juicedebris))
			{
				spr_palette = other.spr_palette;
				paletteselect = other.paletteselect;
				image_speed = 0;
				sprite_index = spr_juicedebris;
				image_index = i;
			}
		}
		switch (global.combo)
		{
			case 0:
			case 1:
				scr_sound(sound_combo1);
				break;
			case 2:
				scr_sound(sound_combo2);
				break;
			case 3:
				scr_sound(sound_combo3);
				break;
			default:
				scr_sound(sound_combo4);
				break;
		}
	}
	if (!important)
	{
		global.combo++;
		switch (global.combo)
		{
			case 0:
			case 1:
				create_small_number(x, y, "10");
				global.collect += 10;
				break;
			case 2:
				create_small_number(x, y, "20");
				global.collect += 20;
				break;
			case 3:
				create_small_number(x, y, "40");
				global.collect += 40;
				break;
			default:
				create_small_number(x, y, "80");
				global.collect += 80;
				break;
		}
		global.combotime = 60;
		global.style += 10;
		global.combofreeze = 30;
	}
	ini_open(global.fileselect);
	var obj = object_get_name(object_index);
	var checkkills = ini_read_real("Kills", obj, 0);
	ini_write_real("Kills", obj, checkkills + 1);
	ini_close();
	ds_list_add(global.baddieroom, id);
}
if (inhaleddestroyvar == 1)
{
	with (obj_player)
	{
		inhalingenemy = true;
		storedinhalebaddie = object_get_name(other.object_index);
	}
}
