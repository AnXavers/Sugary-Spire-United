with (obj_player)
{
	visible = true;
	state = other.storedstate;
	movespeed = other.storedmovespeed;
	grav = other.storedgrav;
	image_index = other.storedimageindex;
	sprite_index = other.storedspriteindex;
	freefallsmash = other.storedfreefallsmash;
	while (place_meeting(x, y, obj_solid))
		y--;
	if (freefallsmash >= 12)
	{
		with (instance_place(x, y + 4, obj_metalblock))
			instance_destroy();
	}
}
with (obj_cookiemount)
{
	visible = true;
	grav = 0.5;
	sprite_index = spr_cookiemountawake;
	image_index = 0;
	while (place_meeting(x, y, obj_solid))
		y--;
}
