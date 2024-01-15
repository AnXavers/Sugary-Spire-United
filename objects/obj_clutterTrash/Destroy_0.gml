var i = 0;
repeat (3)
{
	with (instance_create(x, y, obj_baddieDead))
	{
		vsp = random_range(-7, -10);
		hsp = random_range(5, 10) * obj_player.image_xscale;
		rotatevalue = random_range(5, 10);
		rotatedirection = obj_player.image_xscale;
		canrotate = true;
		sprite_index = spr_clutterTrash_destroyed;
		image_index = i;
		image_speed = 0;
	}
}
