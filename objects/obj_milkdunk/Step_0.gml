if (instance_place(x, y - 1, obj_player) && obj_player.state == states.barrelcrouch)
{
	alarm[0] = 1;
	obj_player.state = states.normal;
	obj_player.ridingmarsh = false;
}
if (instance_place(x, y - 1, obj_cookiemount))
{
	instance_destroy(obj_cookiemount);
	alarm[0] = 1;
}
