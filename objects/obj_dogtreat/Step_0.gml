if (global.collectsound < 10)
	global.collectsound++;
if (collectvanish == 0 && obj_player.ridingmarsh)
{
	if (distance_to_object(obj_player) < 26 && gotowardsPlayer == 0)
		gotowardsPlayer = true;
}
if (gotowardsPlayer == 1)
{
	move_towards_point(obj_player.x, obj_player.y, movespeed);
	movespeed++;
}
if !obj_player.ridingmarsh
	image_alpha = 0.5
else
	image_alpha = 1