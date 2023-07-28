function scr_enemy_scared()
{
	if (!scare_jump || grounded)
		hsp = 0;
	image_speed = 0.35;
	if (object_index == obj_fizz || object_index == obj_froth || object_index == obj_conedrone)
		vsp = 0;
}
