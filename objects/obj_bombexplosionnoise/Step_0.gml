if (image_index > 9)
	mask_index = spr_null;
if (place_meeting(x, y, obj_destructibles))
{
	with (instance_place(x, y, obj_destructibles))
	{
		DestroyedBy = other.id;
		event_user(0);
	}
}
if (place_meeting(x, y, obj_metalblock))
{
	with (instance_place(x, y, obj_metalblock))
	{
		DestroyedBy = other.id;
		event_user(0);
	}
}
if (place_meeting(x, y, obj_chocofrog))
{
	with (instance_place(x, y, obj_chocofrog))
		instance_destroy()
}
