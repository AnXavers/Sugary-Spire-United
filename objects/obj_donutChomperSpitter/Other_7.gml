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
		with (instance_create(x, y, obj_donutSlammable))
		{
			var _angle = (other.image_xscale > 0) ? other.image_angle : (other.image_angle - 180);
			hsp = lengthdir_x(14, _angle);
			vsp = lengthdir_y(14, _angle);
			shattedBy = other.object_index;
			image_angle = (other.image_angle - 90)
		}
		givenPoints = true;
	}
	sprite_index = spr_donutShitterShitting;
}
if (sprite_index == spr_donutShitterShitting)
{
	vspeed = -4;
	sprite_index = spr_donutShitter;
}
