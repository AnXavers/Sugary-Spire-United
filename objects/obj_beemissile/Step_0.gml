x += (image_xscale * (4 + accel));
accel += 0.2;
if (scr_solid(x + (1 * image_xscale), y))
{
	instance_create(x, y, obj_bumpeffect);
	instance_destroy();
}
if (count <= 0)
{
	instance_destroy();
	instance_create(x, y, obj_bombexplosioncherry);
}
if (place_meeting(x, y, obj_donutShitted))
	instance_destroy();
if (place_meeting(x, y, obj_player))
	scr_hurtplayer(obj_player);
if (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_slope))
{
	instance_create(x, y, obj_bombexplosioncherry);
	instance_destroy();
}
