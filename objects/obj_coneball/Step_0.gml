if (image_alpha == 1)
{
	var dir = point_direction(x, y, obj_player.x, obj_player.y);
	if (!global.freezeframe)
	{
		x = approach(x, obj_player.x, lengthdir_x(8, dir));
		y = approach(y, obj_player.y, lengthdir_y(8, dir));
	}
}
else
	image_alpha += 0.01;
var pid = instance_place(x, y, obj_player);
if (pid > 0 && !pid.cutscene && !instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade) && image_alpha == 1)
{
	with (pid)
	{
		instance_destroy(obj_fadeout);
		targetDoor = "A";
		room = timesuproom;
		state = 30;
		sprite_index = spr_Timesup;
		image_index = 0;
		audio_stop_all();
		scr_sound(mu_timesup);
	}
	instance_destroy();
}
