if (image_alpha == 1 && global.possessed != id)
{
	var dir = point_direction(x, y, obj_player.x, obj_player.y);
	if (!global.freezeframe)
	{
		if (!coneballtype || global.getawayfill < 1)
		{
			x = approach(x, obj_player.x, lengthdir_x(8 * coneballspeed * parryspeed, dir));
			y = approach(y, obj_player.y, lengthdir_y(8 * coneballspeed * parryspeed, dir));
		}
		else
		{
			hspeed = lerp(hspeed, lengthdir_x(10 * coneballspeed * parryspeed, dir), 0.02)
			vspeed = lerp(vspeed, lengthdir_y(10 * coneballspeed * parryspeed, dir), 0.02)
		}
	}
}
else if image_alpha != 1
	image_alpha += 0.01;
var pid = instance_place(x, y, obj_player);
if (pid > 0 && !pid.cutscene && obj_player.state != states.actor && !instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade) && image_alpha == 1 && global.possessed != id)
{
	with (pid)
	{
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
if (global.coneballparry == 1 && distance_to_object(obj_parryhitbox) <= 40)
{
	vspeed = 0
	hspeed = 0
	audio_stop_sound(sound_parry);
	scr_sound(sound_parry);
	global.screenflash = 3
	parryspeed = -2
	alarm[1] = 10
	with (obj_player)
	{
		state = states.parry;
		sprite_index = choose(spr_parry1, spr_parry2, spr_parry3);
		image_index = 0;
		movespeed = -8;
		flash = 1;
		with (instance_create(x, y, obj_bangeffect))
			sprite_index = spr_parryeffect;
	}
}