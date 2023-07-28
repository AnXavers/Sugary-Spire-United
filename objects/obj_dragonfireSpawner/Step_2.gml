if (!spawnFire && point_in_rectangle(x, y, obj_player.x - 1000, obj_player.y - 250, obj_player.x + 1000, obj_player.y + 250))
{
	spawnFire = true;
	alarm[0] = 1;
}
