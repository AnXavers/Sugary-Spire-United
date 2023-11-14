if (sprite_index == spr_grabbiehand_fall)
{
	with (obj_player)
	{
		if (state == 16)
		{
			scr_sound(sound_losetransformation);
			for (var i = 0; i <= 4 ; i++)
			{
				with (instance_create(x, y, obj_boxxeddebris))
					image_index = i;
			}
		}
		if (state == 14 || state == 15)
		{
			scr_sound(sound_losetransformation);
			repeat 8
				instance_create(x, y, obj_slimedebris);
		}
	}
	grav = 0;
	vsp = 0;
	grabbing = 1;
	sprite_index = spr_grabbiehand_catch;
	scr_sound(sound_destroyblock1);
	with other
	{
		image_index = 0;
		sprite_index = spr_catched;
		state = states.door;
		x = other.x;
		y = other.y;
		vsp = 0;
		hsp = 0;
	}
}
if (sprite_index == spr_grabbiehand_catch)
{
	with other
	{
		vsp = 0;
		hsp = 0;
		state = states.door;
		sprite_index = spr_catched;
		x = other.x;
		y = other.y;
	}
}
if (obj_player.state == 23)
{
	if (thumbingup == 0 && ((x <= (xstarte + 5) && x >= (xstarte - 5)) && ((y <= (ystarte + 5) && y >= (ystarte - 5)) && grabbing == 0)))
	{
		scr_sound(sound_destroyblock1);
		delay = 5;
		image_xscale = -other.xscale;
		thumbingup = 1;
		instance_create(x, y, obj_bangeffect);
		sprite_index = spr_grabbiehand_hifive;
		image_index = 0;
	}
}
