if global.levelname == "yogurt"
	instance_destroy()
if (ds_list_find_index(global.saveroom, id) == -1)
{
	global.secretfound++;
	with (obj_tv)
	{
		scr_controlprompt("[spr_promptfont]You have found " + string(global.secretfound) + ((global.secretfound > 1) ? " secrets out of 3!" : " secret out of 3!"), -4, 150);
		if global.levelname == "secrets"
			scr_controlprompt("[spr_promptfont]You have found " + string(global.secretfound) + ((global.secretfound > 1) ? " secrets out of " + string(global.secretstotal) + "!" : " secret out of " + string(global.secretstotal) + "!"), -4, 150);
		showtext = 1;
		alarm[0] = 150;
	}
	scr_sound(sound_secretgot);
	ds_list_add(global.saveroom, id);
}
var _time = time_in_frames(0, 25)
global.secrettime = _time
if (global.gamemode == 1 && global.levelname == "secrets")
	global.getawayfill = _time