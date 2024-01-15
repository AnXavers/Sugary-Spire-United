with (instance_create(x, y + 16, obj_baddieDead))
{
	vsp = random_range(-7, -10);
	hsp = random_range(5, 10) * obj_player.image_xscale;
	rotatevalue = random_range(5, 10);
	rotatedirection = obj_player.image_xscale;
	canrotate = true;
	sprite_index = spr_clutterCone_destroyed;
	image_speed = 0;
}
