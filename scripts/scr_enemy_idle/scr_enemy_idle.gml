function scr_enemy_idle()
{
	if (vsp > 1 && grounded && object_index != obj_beesoldier)
	{
		instance_create(x, y, obj_landcloud);
		image_index = 0;
	}
	if (floor(image_index) == (image_number - 1) && roaming == 1 && grounded)
	{
		state = 3;
		image_index = 0;
	}
	if (grounded && vsp > 0)
		hsp = 0;
	else if (!grounded)
		hsp = approach(hsp, 0, 0.1);
	if (object_index != obj_beesoldier)
		sprite_index = idlespr;
	image_speed = 0.35;
	if (animation_end() && sprite_index == spr_beesoldier_intro)
	{
		state = enemystates.thrown;
		sprite_index = spr_throw;
		image_index = 0;
	}
}
