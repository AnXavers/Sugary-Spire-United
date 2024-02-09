function scr_rocketfist_pizzano()
{
	if (windingAnim < 2000) 
		windingAnim++;
	mach2 = 100;
	move = (key_left + key_right);
	vsp = 0
	hsp = (xscale * movespeed);
	mach2++
	machpunchAnim = true;
	if sprite_index == spr_superjump_cancelprep && (floor(image_index) == (image_number - 1))
	{
		image_index = 0
		if grounded
		{
			if (movespeed > 16)
				sprite_index = spr_superjump_cancelgroundedmach4
			else if (movespeed <= 16)
				sprite_index = spr_superjump_cancelgrounded
		}
		else
		{
			if (movespeed > 16)
				sprite_index = spr_superjump_cancelmach4
			else if (movespeed <= 16)
				sprite_index = spr_superjump_cancel
		}
		movespeed = (movespeed * 1.50);
		flash = 1
	}
else if sprite_index != spr_superjump_cancelprep
	{
	if !key_up && !key_down
		vsp = 0
	move = (key_left + key_right)
	if movespeed > 12
		hsp = (xscale * movespeed)
	else
	{
		hsp = (xscale * 12);
		movespeed = 12;
	}
	if (move != 0 && move == xscale) 
	{
		if (movespeed < 24) {
			if (!mach4mode)
				movespeed += 0.0375;
			else
				movespeed += 0.15;		
		}
	}
	if (movespeed > 16 && !mach4mode && sprite_index != spr_superjump_cancelmach4 && sprite_index != spr_superjump_cancelgroundedmach4 && sprite_index != spr_crouchslide)
	{
		mach4mode = true;
		flash = 1;
		if !grounded
			sprite_index = spr_superjump_cancelmach4;
		else
			sprite_index = spr_superjump_cancelgroundedmach4;
		with (instance_create(x, y, obj_slapstar)) 
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}		
	}
	else if (movespeed <= 16 && sprite_index == spr_superjump_cancelmach4 || sprite_index = spr_superjump_cancelgroundedmach4) 
	{
		mach4mode = false;
		if !grounded
			sprite_index = spr_superjump_cancel;
		else
			sprite_index = 	spr_superjump_cancelgrounded;
	}	
	if key_jump && grounded
	{
		state = states.pizzano_machtwirl
	}
	
	if key_up 
		vsp = -5
	if key_down
		vsp = 5
	if scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles)
	{
			scr_sound(sound_maximumspeedland);
		with (obj_camera)
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		image_speed = 0.35;
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				stun = 1;
				alarm[0] = 200;
				ministun = 0;
				vsp = -5;
				hsp = 0;
			}
		}
		flash = 0;
		combo = 0;
		sprite_index = spr_mach3hitwall;
		state = states.bump;
		hsp = -2.5 * xscale;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
	
	}
	
	if !grounded && hsp != 0 && sprite_index != spr_superjump_cancel
		sprite_index = spr_superjump_cancel
	if ((key_attack2 && key_up && charged) || (character == "T" && key_up))
	{
		flash = 1
		alarm[0] = 240
		image_index = 0
		state = states.Sjump
		sprite_index = spr_superjumpprep;
	}
	if key_down && grounded
		sprite_index = spr_crouchslide
	else if !key_down && grounded && hsp != 0
		sprite_index = 	spr_superjump_cancelgrounded
	if key_jump2 && character != "PT"
	{
		state = states.mach2
		doublejumped = 1
		vsp = -10
		sprite_index = spr_djump
	}
	if key_jump2 && character == "PT"
	{
		state = states.jump
		doublejumped = 0
		vsp = -15
		sprite_index = spr_noise_noisebombspinjump
	}
	if key_attack2 && character != "PT"
	{
		image_index = 0;
		state = states.freefallprep;
		sprite_index = spr_pizzelle_groundpoundprep;
		vsp = -6;
	}
	if key_attack2 && character == "PT"
	{
		image_index = 0;
		state = states.Sjump;
		sprite_index = spr_noise_jetpackboostdown;
		scr_sound(sound_superjumprelease)
	}
	if key_sprint2 && character != "PT"
	{
		image_index = 0;
		state = states.mach2;
		sprite_index = spr_mach2;
		vsp = -5;
	 }
	 if key_sprint2 && character == "PT"
	{
		image_index = 0;
		state = states.pogo;
		sprite_index = spr_noise_pogostart;
		vsp = -10;
		pogospeed = movespeed
	 }
		if ((!instance_exists(obj_crazyrunothereffect)) && sprite_index == spr_crazyrun)
		{
			instance_create(x, y, obj_crazyrunothereffect, 
			{
				playerID: id
			}
)
		}
		if (!instance_exists(obj_crazyruneffect))
		{
			instance_create(x, y, obj_crazyruneffect, 
			{
				playerID: id
			}
)
		}
		if ((!instance_exists(obj_chargeeffect)) && sprite_index != spr_dive)
		{
			instance_create(x, y, obj_chargeeffect, 
			{
				playerID: id
			}
)
		}
		if ((!instance_exists(obj_superdashcloud)) && grounded)
		{
			instance_create(x, y, obj_superdashcloud, 
			{
				playerID: id
			}
)
		}
	}
	if sprite_index == spr_noise_jetpackstart
		image_speed = 0.50
	else
		image_speed = 0.35
	do_taunt()
}