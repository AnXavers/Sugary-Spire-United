scr_getinput();
if (!global.gamePauseState && !instance_exists(obj_fadeout))
{
	if (global.shellactivate == 0 && key_start2 && room != rank_room && room != rm_introVideo && room != realtitlescreen && room != rm_titlecard && !instance_exists(obj_titlecard) && canmove && obj_gamepadder.gamepad_discovered == 0 && obj_player.state != states.victory && !global.preventpause)
		event_user(4);
	if (keyboard_check_pressed(vk_f12))
	{
		screenshot_surface = surface_create(global.cam_w, global.cam_h);
		surface_set_target(screenshot_surface);
		draw_clear_alpha(0, 0);
		gpu_set_blendenable(false);
		draw_surface(application_surface, 0, 0);
		gpu_set_colorwriteenable(0, 0, 0, 1);
		draw_set_color(c_white);
		draw_rectangle(-192, -192, 1152, 732, false);
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(1, 1, 1, 1);
		surface_reset_target();
		var file = get_save_filename_ext("screenshot|*.png", "", working_directory, "Save your Screenshot");
		if (file != "")
			surface_save(screenshot_surface, file);
	}
}
if (global.gamePauseState)
{
	if (canmove)
	{
		scr_getinput();
		if (key_down2 && selected < 3)
		{
			selected++;
			scr_sound(sound_land);
		}
		if (key_up2 && selected > 0)
		{
			selected--;
			scr_sound(sound_land);
		}
		if (key_jump)
			event_user(selected);
	}
}
bgTileX++;
bgTileY++;
if (pausecount != 0 && pausecount > 0)
	pausecount--;
if (pausecount == 0)
{
	alarm[1] = 1;
	pausecount = -1;
}
frameref += 0.35;