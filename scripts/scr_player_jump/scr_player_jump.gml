function state_player_jump()
{
	move = key_left + key_right;
	if (momemtum == 0)
		hsp = move * movespeed;
	else
		hsp = xscale * movespeed;
	if (move != xscale && momemtum == 1 && movespeed != 0)
		movespeed = approach(movespeed, 0, 0.1);
	if (movespeed <= 0)
		momemtum = 0;
	if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
	{
		movespeed = 0;
		mach2 = 0;
	}
	if (move != 0 && movespeed < 7)
		movespeed += 0.5;
	if (movespeed > 7)
		movespeed -= 0.1;
	if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
		movespeed = 0;
	if (dir != xscale)
	{
		mach2 = 0;
		dir = xscale;
		movespeed = 0;
	}
	if (move == -xscale)
	{
		mach2 = 0;
		movespeed = 0;
		momemtum = 0;
	}
	landAnim = 1;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (ladderbuffer > 0)
		ladderbuffer--;
	if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
	{
		vsp = grav;
		jumpstop = 1;
	}
	if (grounded && input_buffer_jump < 8 && !key_down && !key_sprint && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		scr_sound(sound_jump);
		sprite_index = spr_pizzelle_jump;
		if (shotgunAnim == 1)
			sprite_index = spr_shotgun_jump;
		instance_create_depth(x, y, -6, obj_highjumpcloud2);
		stompAnim = 0;
		vsp = -11;
		state = states.jump;
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		freefallstart = 0;
		instance_create_depth(x, y, 0, obj_landcloud);
	}
	if (key_sprint && (obj_player.character == "N" || obj_player.character == "T") && charged)
	{
		sprite_index = spr_superjump_cancelprep;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		charged = 0;
		state = states.pizzano_rocketfist;
	}
	if (key_up && (obj_player.character == "N" || obj_player.character == "T") && charged)
	{
		alarm[0] = 240;
		sprite_index = spr_superjump;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		state = states.Sjump;
	}
	if (key_sprint && character == "PT" && pogochargeactive = 1)
	{
		if !key_up
		{
		sprite_index = spr_superjump_cancelprep;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		charged = 0;
		state = states.pizzano_rocketfist;
		}
		else
		{
		alarm[0] = 240;
		sprite_index = spr_superjumpprep;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		state = states.Sjump;
	}
	}
	if (key_up && (obj_player.character == "N" || obj_player.character == "T") && charged)
	{
		alarm[0] = 240;
		sprite_index = spr_superjump;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		state = states.Sjump;
	}
	if (key_sprint && grounded && fallinganimation < 40 && character == "DEEZNUTS")
	{
		mach2 = 0;
		movespeed = 0;
		sprite_index = spr_null;
		jumpAnim = 1;
		state = states.pizzano_mach;
		image_index = 0;
	}
		 if (key_sprint && !pogochargeactive && !key_attack2 && character == "PT")
			{
				sprite_index = spr_noise_pogostart
				image_index = 0
				pogospeed = movespeed
				state = states.pogo
			}
	if (grounded && vsp > 0 && !key_sprint)
	{
		if (key_sprint)
			landAnim = 0;
		input_buffer_secondjump = 0;
		state = states.normal;
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		freefallstart = 0;
		instance_create_depth(x, y, 0, obj_landcloud);
		scr_sound(sound_step);
		doublejumped = 0;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (vsp > 5)
		fallinganimation++;
	if ((fallinganimation >= 40 && fallinganimation < 80) && sprite_index != spr_candyup)
		sprite_index = spr_freefall;
	if ((fallinganimation >= 40 && fallinganimation < 80) && sprite_index == spr_candyup)
	{
		sprite_index = spr_freefall;
		if (!instance_exists(obj_candifiedeffect1))
			instance_create(x, y, obj_candifiedeffect1);
	}
	if (fallinganimation >= 80)
		sprite_index = spr_freefall2;
	if (stompAnim == 0)
	{
		if (jumpAnim == 1)
		{
			if (floor(image_index) == (image_number - 1))
				jumpAnim = 0;
		}
		if (jumpAnim == 0)
		{
			if (sprite_index == spr_airdash1)
				sprite_index = spr_airdash2;
			if (sprite_index == spr_suplexdashCancel)
				sprite_index = spr_pizzelle_fall;
			if (sprite_index == spr_pizzelle_jump)
				sprite_index = spr_pizzelle_fall;
		}
	}
	if (stompAnim == 1)
	{
		if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
			sprite_index = spr_stomp;
	}
	if (move != 0)
		xscale = move;
	image_speed = 0.35;
	if (key_shoot2 && global.treat)
	{
		vsp = -5;
		state = states.donut;
		image_index = 0;
		sprite_index = spr_throwDonut;
		with (instance_create(x, y + 16, obj_donutThrowable))
		{
			image_xscale = other.xscale;
			if (other.key_up)
			{
				movespeed = 8;
				vsp = -5;
			}
			else
			{
				movespeed = 9;
				vsp = 5;
			}
		}
	}
	do_grab();
	if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall || sprite_index == spr_freefall2))
	{
		scr_sound(sound_maximumspeedland);
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		image_index = 0;
		sprite_index = spr_freefallland;
		state = states.freefallland;
		doublejumped = 0;
	}
	do_taunt();
	scr_noise_abilities();
	scr_coneboy_copyabilities()
	if (key_down2)
	{
		image_index = 0;
		sprite_index = spr_pizzelle_groundpoundprep;
		vsp = -6;
		if (global.treat)
		{
			vsp = -10;
			sprite_index = spr_donutSlam_intro;
			instance_create(x, y, obj_donutSlammable);
		}
		state = states.freefallprep;
		if (character == "N")
			vsp = 0;
	}
	if (global.cane == 1)
	{
		if (!grounded)
			canrebound = 0;
		if (key_down2)
		{
			image_index = 0;
			state = states.freefall;
			sprite_index = spr_caneslam;
			vsp = -18;
		}
		if (!key_down && key_attack2 && suplexmove == 0 && shotgunAnim == 0)
		{
			scr_sound(sound_suplex1);
			instance_create(x, y, obj_slaphitbox);
			suplexmove = 1;
			vsp = 0;
			instance_create(x, y, obj_jumpdust);
			image_index = 0;
			sprite_index = spr_canesuplex;
			state = 17;
		}
	}
	if (sprite_index == spr_caneslam)
	{
		vsp = 17;
		if (!instance_exists(obj_mach3effect))
			instance_create(x, y - 32, obj_mach3effect);
	}
	if (key_jump && (obj_player.character == "G") && !grounded && gumbobpropellercooldown == 0)
	{
		state = states.gumbob_propeller;
		sprite_index = spr_propeller_start;
		movespeed = 0;
		vsp = 0;
	}
	if (key_jump && !grounded && doublejumped == 0 && !scr_solid(x + xscale, y, true))
	{
			if  (character == "N" || character == "PT")
		{
		doublejumped = 1;
		vsp = -10;
		sprite_index = spr_djump;
		jumpAnim = (character == "PT" ? true : false)
		}
	}
			if character == "C" && key_jump
		{
			vsp = -10;
			sprite_index = spr_coneboy_inhaledjump;
			image_index = 0
			jumpAnim = true
		}
	if (key_jump && (obj_player.character == "N"))
		{
			if place_meeting((x + xscale), y, obj_solid)
			{
				scr_sound(sound_step)
				sprite_index = spr_pizzano_wallcling
				image_index = 0
				state = states.pizzano_wallcling
				vsp = 0
				doublejumped = 0
			}
		}
			if (key_jump && character = "PT" && wallclingcooldown == 10)
		{
			if place_meeting((x + xscale), y, obj_solid)
			{
				scr_sound(sound_step)
				sprite_index = spr_noise_wallclingstart
				image_index = 0
				state = states.pizzano_wallcling
				vsp = 0
				xscale *= -1
				doublejumped = 0
			}
		}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_noise_doublejump)
		sprite_index = spr_noise_doublejumpfall
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_candytransitionup)
		sprite_index = spr_candyup;
	if (character == "C" && inhalingenemy == 1 && key_attack && !grounded)
	{
		sprite_index = spr_spitair;
		with (instance_create(x, y, obj_coneboyprojectile))
			directionthing = 1;
		inhalingenemy = false;
		vsp -= 4;
	}
	if (sprite_index == spr_spitair)
	{
		hsp = xscale * movespeed;
		hsp = -5 * xscale;
		move = 0;
	}
	if (key_sprint && grounded && fallinganimation < 40 && pogochargeactive = 0)
	{
		if character != "PT"
		{
			mach2 = 0;
			if (movespeed < 6)
				movespeed = 6;
			sprite_index = spr_mach1;
				image_index = 0;
			jumpAnim = 1;
			state = states.mach2;
			if global.moveset == 2
				state = states.mach1
		}
		else
		{
			sprite_index = spr_noise_pogobounce
			image_index = 0
			pogospeed = movespeed
			state = states.pogo
		}
	}
	
}

