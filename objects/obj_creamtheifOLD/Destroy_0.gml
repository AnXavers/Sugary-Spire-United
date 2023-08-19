if (ds_list_find_index(global.baddieroom, id) == -1 || important)
{
	obj_tv.image_index = irandom_range(0, 4);
	repeat (3)
		instance_create(x, y, obj_slapstar);
	instance_create(x, y + 30, obj_bangeffect);
	camera_shake(10, 30);
	if (debris == 1)
	{
		with (instance_create(x, y, obj_baddieDead))
		{
			sprite_index = other.deadspr;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
		}
		var i = random_range(0, 100);
		if (i >= 95)
			scr_sound(sfx_scream1, sfx_scream2, sfx_scream3, sfx_scream4, sfx_scream5, sfx_scream6);
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
	if (theifkeyinv == 1)
		instance_create(x, y, obj_spookey);
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
