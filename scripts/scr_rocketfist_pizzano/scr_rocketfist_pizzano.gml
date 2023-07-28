function scr_rocketfist_pizzano()
{
	if (windingAnim < 2000)
		windingAnim++;
	mach2 = 100;
	move = key_left + key_right;
	vsp = 0;
	hsp = xscale * movespeed;
	mach2++;
	if (sprite_index == spr_pizzano_sjumpprepside && floor(image_index) == (image_number - 1))
	{
		image_index = 0;
		if (grounded)
		{
			if (movespeed > 16)
				sprite_index = spr_pizzano_sjumpsidemach4grounded;
			else if (movespeed <= 16)
				sprite_index = spr_pizzano_mach3;
		}
		else if (movespeed > 16)
			sprite_index = spr_pizzano_sjumpsidemach4;
		else if (movespeed <= 16)
			sprite_index = spr_pizzano_sjumpside;
		movespeed *= 1.5;
		flash = 1;
	}
	else if (sprite_index != spr_pizzano_sjumpprepside)
	{
		if (!key_up && !key_down)
			vsp = 0;
		move = key_left + key_right;
		if (movespeed > 12)
			hsp = xscale * movespeed;
		else
		{
			hsp = xscale * 12;
			movespeed = 12;
		}
		if (move != 0 && move == xscale)
		{
			if (movespeed < 24)
			{
				if (!mach4mode)
					movespeed += 0.0375;
				else
					movespeed += 0.15;
			}
		}
		if (movespeed > 16 && !mach4mode && sprite_index != spr_pizzano_sjumpsidemach4 && sprite_index != spr_pizzano_sjumpsidemach4grounded && sprite_index != spr_pizzano_crouchslide)
		{
			mach4mode = true;
			flash = 1;
			if (!grounded)
				sprite_index = spr_pizzano_sjumpsidemach4;
			else
				sprite_index = spr_pizzano_sjumpsidemach4grounded;
			with (instance_create(x, y, obj_slapstar))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
			}
		}
		else if ((movespeed <= 16 && sprite_index == spr_pizzano_sjumpsidemach4) || sprite_index == spr_pizzano_sjumpsidemach4grounded)
		{
			mach4mode = false;
			if (!grounded)
				sprite_index = spr_pizzano_sjumpside;
			else
				sprite_index = spr_pizzano_mach3;
		}
		if (key_jump && grounded)
			state = states.pizzano_machtwirl;
		if (key_up)
			vsp = -5;
		if (key_down)
			vsp = 5;
		if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
		{
			vsp = -6;
			movespeed = -6;
			sprite_index = spr_player_mach3hitwall;
			state = states.bump;
		}
		if (!grounded && hsp != 0 && sprite_index != spr_pizzano_sjumpside)
			sprite_index = spr_pizzano_sjumpside;
		if (key_slap2 && key_up && charged)
		{
			flash = 1;
			alarm[0] = 240;
			image_index = 0;
			state = states.bump;
			sprite_index = spr_pizzano_sjumpprep;
		}
		if (key_down && grounded)
			sprite_index = spr_pizzano_crouchslide;
		else if (!key_down && grounded && hsp != 0)
			sprite_index = spr_pizzano_mach3;
		if (key_jump2)
		{
			state = states.mach2;
			doublejumped = 1;
			vsp = -10;
			sprite_index = spr_pizzano_djump;
		}
		if (key_slap2)
		{
			image_index = 0;
			state = states.freefallprep;
			sprite_index = spr_bodyslamstart;
			vsp = -6;
		}
		if (key_attack2)
		{
			image_index = 0;
			state = states.mach2;
			sprite_index = spr_pizzano_mach2;
			vsp = -5;
		}
		if (!instance_exists(obj_crazyrunothereffect) && sprite_index == spr_crazyrun)
			instance_create(x, y, 412, 
			{
				playerID: id
			});
		if (!instance_exists(obj_crazyruneffect))
			instance_create(x, y, 430, 
			{
				playerID: id
			});
		if (!instance_exists(obj_chargeeffect) && sprite_index != spr_dive)
			instance_create(x, y, 455, 
			{
				playerID: id
			});
		if (!instance_exists(obj_superdashcloud) && grounded)
			instance_create(x, y, 451, 
			{
				playerID: id
			});
	}
	image_speed = 0.35;
	do_taunt();
}
