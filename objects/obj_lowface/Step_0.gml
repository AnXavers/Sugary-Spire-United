if (image_alpha == 1)
{
	var dir = point_direction(x, y, obj_player.x, obj_player.y);
	if (!global.freezeframe)
	{
		var _xdistance = abs(x - obj_player.x)
		var _ydistance = abs(y - obj_player.y)
		if global.lowfacefill > 0
		{
			if ((lastframexdistance + 8) <= _xdistance)
				hspeed = lerp(hspeed, lengthdir_x(16 * coneballspeed * parryspeed, dir), 0.02)
			else
				hspeed = lerp(hspeed, lengthdir_x(10 * coneballspeed * parryspeed, dir), 0.02)
			if ((lastframeydistance + 8) <= _ydistance)
				vspeed = lerp(vspeed, lengthdir_y(16 * coneballspeed * parryspeed, dir), 0.02)
			else
				vspeed = lerp(vspeed, lengthdir_y(10 * coneballspeed * parryspeed, dir), 0.02)
		}
		else
		{
			x = approach(x, obj_player.x, lengthdir_x(16 * coneballspeed * parryspeed, dir));
			y = approach(y, obj_player.y, lengthdir_y(16 * coneballspeed * parryspeed, dir));
		}
		lastframexdistance = _xdistance
		lastframeydistance = _ydistance
	}
}
else
	image_alpha += 0.01;
var pid = instance_place(x, y, obj_player);
if (pid > 0 && !pid.cutscene && !instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade) && image_alpha == 1)
{
	with (pid)
	{
		scr_sound(sfx_lowface_jumpscare);
		instance_destroy(obj_fadeout);
		targetDoor = "A";
		room = timesuproom;
		state = states.timesup;
		sprite_index = spr_Timesup;
		image_index = 0;
		audio_stop_all();
		scr_sound(mu_timesup);
	}
	instance_destroy();
}