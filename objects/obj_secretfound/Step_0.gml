for (var i = 0; i < ds_list_size(collectiblelist); i++)
{
	var b = ds_list_find_value(collectiblelist, i);
	b.image_index += b.image_speed;
	if (b.image_index >= b.image_number)
		b.image_index = frac(b.image_index);
}
trace(ds_list_size(collectiblelist));
if (global.secrettime <= 0 && global.levelname == "secrets")
{
	with (obj_player)
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
}
if global.gamemode != 1
	global.secrettime--