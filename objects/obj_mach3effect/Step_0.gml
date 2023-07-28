if (playerID.state != 70 && playerID.state != 3 && playerID.state != 5 && playerID.state != 69 && playerID.state != 17 && playerID.state != 71 && playerID.state != 37 && playerID.state != 28 && playerID.state != 34 && playerID.state != 36 && playerID.state != 101 && playerID.state != 31 && playerID.state != 28 && playerID.state != 63 && playerID.state != 93 && playerID.state != 96 && playerID.state != 125 && (playerID.state != 60 && playerID.state != 89 && playerID.state != 103 && global.cane == 0 && playerID.state != 104 && playerID.state != 121 && playerID.state != 68))
	vanish = 1;
if (vanish == 1)
{
	if (gonealpha > 0)
		gonealpha -= 0.15;
	else if (gonealpha <= 0)
		instance_destroy();
}
visible = playerID.visible;
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
