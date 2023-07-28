if (instance_exists(obj_train))
{
	with (obj_train)
	{
		x = xstart;
		y = ystart;
		image_xscale = start_xscale;
		sprite_index = spr_spray;
		repeat (5)
			instance_create((x + irandom_range(-90, 90)), (y + irandom_range(20, -20)), obj_poofeffect)
		vsp = 0;
		movespeed = 10;
		state = 1;
	}
}
