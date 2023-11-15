if (state == enemystates.walk)
{
	scr_collision();
	sprite_index = sourbuddywalkspr;
	if (sign(obj_player.x - x) != 0)
		image_xscale = sign(obj_player.x - x);
	hsp = approach(hsp, image_xscale * movespeed, accel);
	if (place_meeting(x, y, obj_player))
	{
		state = 7;
		persistent = true;
		ds_list_add(obj_player.sour_buddies, id);
	}
}
if (state == 7)
{
	x = obj_player.x + (offsetx * image_xscale);
	y = obj_player.y + offsety;
	image_xscale = sign(obj_player.xscale) * dir;
	depth = -100;
	sprite_index = sourbuddyattachspr;
	if (shake_delay > 0)
		shake_delay--;
	else
	{
		shakemag = random_range(-4, 4);
		shake_delay = random_range(60, 120);
	}
	shakemag = approach(shakemag, 0, 0.05);
	if (ds_list_find_index(obj_player.sour_buddies, id) == -1)
		instance_destroy();
}
