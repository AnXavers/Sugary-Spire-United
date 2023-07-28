if ((obj_player.x > (x - 200) && obj_player.x < (x + 200)) && (y <= (obj_player.y + 200) && y >= (obj_player.y - 200)))
{
	if (timer != -2)
		timer -= 0.1;
	if (timer == -2 && obj_player.state == 45)
		timer = 20;
	if (timer == -2 && obj_player.state != 45)
	{
		with (obj_player)
			scr_hurtplayer();
		if (obj_player.state != 73)
			timer = 20;
	}
}
