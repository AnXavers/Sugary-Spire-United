if (sprite_index == spr_donutShitterEating)
{
	if (!givenPoints)
	{
		audio_stop_sound(sound_points);
		scr_sound(sound_points);
		scr_sound(sfx_gumspit);
		global.collect += 50;
		create_small_number(x, y, "50");
		instance_create(x, y, obj_collecteffect, 
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
