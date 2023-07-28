instance_destroy();
instance_create(x, y, obj_bombexplosionconeboy);
with (obj_camera)
{
	shake_mag = 10;
	shake_mag_acc = 30 / room_speed;
}
