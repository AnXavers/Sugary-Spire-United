if (setfordeath && !global.hitstunEnabled)
{
	camera_shake(3, 3);
	repeat (2)
		instance_create(x, y, obj_slapstar);
	with (obj_bosscontroller)
		event_user(0);
	setfordeath = false;
}
