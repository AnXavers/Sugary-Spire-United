if (sprite_index == spr_donutShitterEating)
{
	if (!givenPoints)
	{
		audio_stop_sound(sound_points);
		scr_sound(sound_points);
		global.collect += 50;
		create_small_number(x, y, "50");
		instance_create(x, y, 280, 
		{
			choosed: true,
			sprite_index: spr_donut_boil
		});
		givenPoints = true;
	}
	sprite_index = spr_donutShitterShitting;
}
if (sprite_index == spr_donutShitterShitting)
{
	vspeed = -4;
	sprite_index = spr_donutShitter;
}
