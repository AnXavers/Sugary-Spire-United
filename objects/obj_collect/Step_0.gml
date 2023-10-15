if (collectvanish == 1 && collectboxid.activated == 1)
{
	x = xstart;
	y = ystart;
	instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_cloudeffect);
	repeat (3)
		instance_create(((x + (sprite_width / 2)) + random_range(-5, 5)), ((y + (sprite_height / 2)) + random_range(-5, 5)), obj_cloudeffect)
	collectvanish = false;
	in_the_void = false;
}
if (global.collectsound < 10)
	global.collectsound++;
depth = (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_metalblock)) ? 102 : 2;
if (collectvanish == 0)
{
	if (distance_to_object(obj_player) < 26 && gotowardsPlayer == 0)
	{
		gotowardsPlayer = true;
		scr_ghostcollectible();
	}
}
if (gotowardsPlayer == 1)
{
	move_towards_point(obj_player.x, obj_player.y, movespeed);
	movespeed++;
}
