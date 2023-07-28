if (place_meeting(x + 2, y, obj_donutShitted) || (place_meeting(x - 2, y, obj_donutShitted) && obj_donutShitted.bigShot == 1))
{
	instance_destroy();
	instance_destroy(obj_donutShitted);
}
