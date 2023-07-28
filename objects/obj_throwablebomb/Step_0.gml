switch (state)
{
	case 1:
		scr_collide();
		break;
	case 40:
		grounded = 0;
		x = playerID.x;
		y = approach(y, playerID.y - 40, 10);
		image_xscale = playerID.xscale;
		break;
	case 87:
		break;
}
image_speed = 1 - (countdown / 240);
