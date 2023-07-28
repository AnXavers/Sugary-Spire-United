if (place_meeting(x + 1, y, obj_waferdestroyable))
{
	with (instance_place(x + 1, y, obj_waferdestroyable))
		alarm[0] = 9;
}
if (place_meeting(x - 1, y, obj_waferdestroyable))
{
	with (instance_place(x - 1, y, obj_waferdestroyable))
		alarm[0] = 9;
}
if (place_meeting(x, y + 1, obj_waferdestroyable))
{
	with (instance_place(x, y + 1, obj_waferdestroyable))
		alarm[0] = 9;
}
if (place_meeting(x, y - 1, obj_waferdestroyable))
{
	with (instance_place(x, y - 1, obj_waferdestroyable))
		alarm[0] = 9;
}
instance_destroy();
