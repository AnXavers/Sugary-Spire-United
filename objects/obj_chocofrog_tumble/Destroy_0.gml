if (ds_list_find_index(global.saveroom, id) == -1)
{
	var combob = clamp(global.combo, 1, 4);
	var combobsnd = asset_get_index("sound_combo" + string(combob));
	scr_sound(combobsnd);
	scr_sound(sound_punch);
	if (object_index == obj_chocofrog_tumble)
		scr_sound(sfx_frogDeathBig);
	else
		scr_sound(sfx_frogDeath);
	global.combo++;
	global.hit++;
	var _score = 10 * power(2, global.combo - 1);
	_score = clamp(_score, 10, 80);
	create_small_number(x, y, string(_score));
	global.collect += _score;
	global.combotime = 60;
	global.style += 10;
	global.combofreeze = 30;
	instance_create(x, y, obj_bangeffect);
	with (instance_create(x, y, obj_bangeffect))
		sprite_index = spr_enemypuncheffect;
	instance_create(x + (sprite_width / 2), y + (sprite_height / 2), (object_index == obj_chocofrog_tumble) ? obj_poofeffect : obj_poofeffectsmall);
	with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_baddieDead))
		sprite_index = other.deadSpr;
	ds_list_add(global.saveroom, id);
}
