depth = -95;
image_speed = 0.35;
image_index = 0;
sprite_index = obj_player.spr_lapportal_exit
if global.lapmode == 1 && global.gamemode != 1
{
	var time_array = scr_laptimes();
	global.fill += time_in_frames(time_array[0], time_array[1]);
	if !instance_exists(obj_panicchanger)
		instance_create(x, y, obj_panicchanger);
}
else if global.lapmode == 2 && global.gamemode != 1
{
	if global.lapcount >= 5
		instance_create(x, y, obj_lowface)
	else if global.lapcount >= 4
	{
		switch global.levelname
		{
			case "entryway":
				global.fill_4 = time_in_frames(1, 0)
				break
			case "steamy":
				global.fill_4 = time_in_frames(1, 0)
				break
			case "stormy":
				global.fill_4 = time_in_frames(1, 0)
				break
			case "molasses":
				global.fill_4 = time_in_frames(1, 10)
				break
			case "mines":
				global.fill_4 = time_in_frames(1, 0)
				break
			case "fudge":
				global.fill_4 = time_in_frames(1, 15)
				break
			case "dance":
				global.fill_4 = time_in_frames(2, 15)
				break
			case "estate":
				global.fill_4 = time_in_frames(1, 10)
				break
			case "sucrose":
				global.fill_4 = time_in_frames(1, 30)
				break
			case "bee":
				global.fill_4 = time_in_frames(1, 40)
				break
			default:
				global.fill_4 = time_in_frames(3, 0)
				break
		}
		global.fill_4 += time_in_frames(0, 2)
		instance_create(0, 0, obj_yogurtexe)
		with (obj_tv)
		{
			timer_y = 150
			timer_out = 220
			timer_in = 60
			oldBall_sprite = spr_timeryogurt_idle
			sucroseTimer = 1
			target_fill = global.fill_4
		}
	}
	else if global.lapcount >= 3
	{
		global.fill = 0;
		if (!instance_exists(obj_panicchanger))
			instance_create(x, y, obj_panicchanger);
	}
}
if (global.lapcount == 10)
{
	global.lap10fg = layer_create(-50, "Backgrounds_foreground");
	global.lap10bgspr = layer_background_create(global.lap10fg, bg_collapsing_spire);
	layer_background_htiled(global.lap10bgspr, true);
	layer_background_vtiled(global.lap10bgspr, true);
	layer_vspeed(global.lap10fg, 3);
	global.dolap10fg = 1;
}
if global.lapmode == 1
{
	if (global.lapcount == 3)
		scr_controlprompt("[spr_promptfont]The heat is rising...")
	else if global.lapcount == 5
		scr_controlprompt("[spr_promptfont]Enemies are getting stronger...")
	else if global.lapcount == 10
		scr_controlprompt("[spr_promptfont]The enemies are starting to multiply...")
}
scr_sound(sfx_lapexit)
with instance_create(x, y, obj_cameraRegion)
{
	zoom = 0.7
	ClampTop = false
	ClampBottom = false
	ClampLeft = false
	ClampRight = false
}
if global.checkpoints
{
	global.checkpointroom = room
	global.checkpointdoor = obj_player.targetDoor
	global.checkpointmusic = obj_music.music
	global.checkpointcombo = global.combo
	global.checkpointcombolost = global.combolost
	global.checkpointhurtcounter = global.hurtcounter
	global.checkpointcollect = global.collect
	global.checkpointfill = global.fill
	ds_list_clear(global.checkpointsaveroom)
	ds_list_clear(global.checkpointbaddieroom)
	ds_list_copy(global.checkpointsaveroom, global.saveroom)
	ds_list_copy(global.checkpointbaddieroom, global.baddieroom)
	scr_sound(sfx_checkpoint)
	obj_tv.checkpointspr = spr_checkpointflag_unvisit
	obj_tv.checkpointalpha = 0
	obj_tv.checkpointindex = 0
}