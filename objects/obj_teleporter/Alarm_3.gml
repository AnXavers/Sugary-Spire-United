with (obj_teleporter)
{
	if (trigger == other.trigger && reciever)
	{
		obj_cookiemount.x = x;
		obj_cookiemount.y = y - 20;
		alarm[2] = 10;
	}
}
alarm[1] = 10;
