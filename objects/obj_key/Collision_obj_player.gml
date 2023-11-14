if (inv_frame == 0 && obj_player.state != 19 && obj_player.state != 7 && obj_player.state != 9 && obj_player.state != 6 && obj_player.state != 20 && obj_player.state != 13 && obj_player.state != states.hurt)
{
	instance_destroy();
	global.key_inv = 1;
	obj_player.key_particles = 1;
	obj_player.alarm[7] = 30;
}
if (global.keyget == 0 && obj_player.state != 19 && obj_player.state != 20 && obj_player.state != 9 && obj_player.state != 6 && obj_player.state != 13)
{
	scr_sound(sound_toppingot);
	obj_player.state = states.keyget;
	obj_player.image_index = 0;
	global.keyget = 1;
	scr_queue_tvanim(obj_tv.happytvspr, 200);
}
