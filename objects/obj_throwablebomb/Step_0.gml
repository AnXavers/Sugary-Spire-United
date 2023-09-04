switch (state)
{
	case 1:
		scr_collide();
		break;
	case 40:
		grounded = 0;
		x = obj_player.x;
		y = approach(y, obj_player.y - 40, 10);
		image_xscale = obj_player.xscale;
		break;
	case 87:
		break;
}
image_speed = 1 - (countdown / 240);
