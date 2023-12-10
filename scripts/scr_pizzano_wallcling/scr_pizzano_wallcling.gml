function scr_pizzano_wallcling()
{
	hsp = 0;
	if (sprite_index == spr_pizzano_wallcling)
		vsp = 0;
	else
		vsp = 3;
	image_speed = 0.35;
	if (sprite_index == spr_pizzano_wallcling && floor(image_index) == (image_number - 1))
		sprite_index = spr_pizzano_wallslide;
	if (key_jump && !grounded)
	{
		movespeed = 8;
		vsp = -12;
		xscale *= -1;
		state = states.pizzano_twirl;
	}
	if ((grounded) || !place_meeting(x + image_xscale, y, par_collision))
		state = states.normal;
}
