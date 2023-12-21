function scr_pizzano_wallcling()
{
	if character == "N"
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
	if character == "PT"
{
	hsp = 0
	if (sprite_index == spr_noise_wallclingstart && floor(image_index) == (image_number - 1))
		sprite_index = spr_noise_wallcling
	vsp = 0
	wallclingcooldown = 0
	if ( !key_jump2)
	{
		jumpstop = 1
		vsp = -15
		state = states.jump
		sprite_index = spr_noise_noisebombspinjump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
	}
	image_speed = 0.35
}
}

