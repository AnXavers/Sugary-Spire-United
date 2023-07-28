with (obj_player)
{
	if (hsp != 0 && (floor(image_index) % 4) == 0 && grounded)
	{
		with (instance_create(x, y + 43, obj_debris))
		{
			sprite_index = spr_snowparticles;
			image_index = irandom_range(0, image_number - 1);
		}
	}
}
