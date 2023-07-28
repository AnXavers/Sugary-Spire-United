if (!place_meeting(x, y, obj_player) && active)
	active = false;
if (reciever)
{
	if (spitting)
	{
		sprite_index = spr_teleporterexit_spit;
		if (prepparticle && image_index > 3)
		{
			instance_create(x, y, obj_telespitfx);
			prepparticle = false;
		}
	}
	else
		sprite_index = spr_teleporterexit;
}
