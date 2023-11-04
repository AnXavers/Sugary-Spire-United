don += 0.35;
if ((place_meeting(x, y, par_donut) || (place_meeting(x, y, obj_player) && global.treat == 1)) && ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_place(x, y, par_donut))
		instance_destroy();
	ds_list_add(global.saveroom, id);
	global.MinesFlags[colorID] = true;
	sprite_index = spr_gnomeMinerBlowingUp;
	image_index = 0;
	image_xscale *= -1;
}
if (sprite_index == spr_gnomeMinerBlowingUp && floor(image_index) >= (image_number - 1))
{
	image_index = 0;
	instance_create(x, y, obj_bombexplosionharmless);
	sprite_index = spr_gnomeMinerBlewUp;
	image_xscale *= -1;
	if instance_exists(wall)
	{
		with wall
			instance_destroy();
	}
	with (obj_gnomeTNTBlock)
	{
		if (colorID == other.colorID)
			alarm[0] = random_range(15, 50);
	}
	camera_shake(20, 40);
}
if (sprite_index == spr_gnomeMinerBlewUp && floor(image_index) >= (image_number - 1))
{
	image_index = 0;
	sprite_index = spr_gnomeMinerIdle;
}
