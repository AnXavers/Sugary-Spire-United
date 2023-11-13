scr_collision();
hsp = lerp(hsp, 0 , 0.05)
vsp += 0.3
movespeed -= 0.5;
if (place_meeting(x, y, par_collision))
{
	instance_destroy()
	instance_create(x, y, obj_bombexplosionnoise);
	with (obj_camera)
	{
		shake_mag = 10;
		shake_mag_acc = 30 / room_speed;
	}
}