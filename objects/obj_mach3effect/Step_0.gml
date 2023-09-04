if (obj_player.state != 70 && obj_player.state != 3 && obj_player.state != 5 && obj_player.state != 69 && obj_player.state != 17 && obj_player.state != 71 && obj_player.state != 37 && obj_player.state != 28 && obj_player.state != 34 && obj_player.state != 36 && obj_player.state != 101 && obj_player.state != 31 && obj_player.state != 28 && obj_player.state != 63 && obj_player.state != 93 && obj_player.state != 96 && obj_player.state != 125 && (obj_player.state != 60 && obj_player.state != 89 && obj_player.state != 103 && global.cane == 0 && obj_player.state != 104 && obj_player.state != 121 && obj_player.state != 68))
	vanish = 1;
if (vanish == 1)
{
	if (gonealpha > 0)
		gonealpha -= 0.15;
	else if (gonealpha <= 0)
		instance_destroy();
}
visible = obj_player.visible;
if (obj_player.state != 0)
	image_alpha = obj_player.movespeed / 16;
else
	image_alpha = obj_player.frozenmovespeed / 16;
with (realcol)
{
	switch (other.color)
	{
		case 1:
			r = 48;
			g = 168;
			b = 248;
			r2 = 15;
			g2 = 57;
			b2 = 121;
			break;
		case 2:
			r = 232;
			g = 80;
			b = 152;
			r2 = 95;
			g2 = 9;
			b2 = 32;
			break;
	}
}
