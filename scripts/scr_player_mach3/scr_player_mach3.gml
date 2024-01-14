function state_player_mach3()
{
	if (windingAnim < 2000)
		windingAnim++;
	mach2 = 100;
	hsp = xscale * movespeed;
	move = key_right + key_left;
	move2 = key_right2 + key_left2;
	momemtum = 1;
	crouchslideAnim = 1;
	if sprite_index == spr_pepperman_shoulderstart
	{
		movespeed = -3
		if floor(image_index) == (image_number - 1)
		{
			sprite_index = spr_mach3player
			movespeed = 12;
		}
		else
			exit;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	switch (character)
	{
		case "N":
		case "G":
			if (grounded && vsp > 0)
				jumpstop = 0;
			if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && key_sprint)
			{
				image_index = 0;
				state = states.pizzano_machtwirl;
				sprite_index = spr_twirl;
				if (!playedjumpsound)
				{
					scr_sound(sound_jump);
					playedjumpsound = mu_rankd;
				}
				vsp = -12;
				dir = xscale
			}
		case "M":
			if (key_shoot2)
			{
				state = states.pepperman_pinball
				image_index = 0;
				sprite_index = spr_pepperman_rolling
				if grounded
					vsp = -16
				exit;
			}
		default:
			if (grounded && vsp > 0)
				jumpstop = 0;
			if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && key_sprint)
			{
				image_index = 0;
				sprite_index = spr_mach3jump;
				if (!playedjumpsound)
				{
					scr_sound(sound_jump);
					playedjumpsound = mu_rankd;
				}
				vsp = -11;
			}
	}
	if (grounded)
	{
		if (global.attackmove == 2 && key_attack && (sprite_index == spr_longjumpend || sprite_index == spr_longjump))
		{
			sprite_index = spr_shoulder
			if (movespeed < 8)
				movespeed = 8;
			state = states.shoulder
			instance_create(x, y, obj_dashcloud)
			image_index = 0;
			image_speed = 0.35;
			exit;
		}
		if (slopeCheck(x, y) && hsp != 0 && movespeed > 12 && movespeed < 18)
			player_slopeMomentum(0.1, 0.2);
	}
	if (move == xscale && grounded)
	{
		if (movespeed < 24)
		{
			if (!mach4mode)
			{
				movespeed += 0.025;
				if character == "M"
					movespeed += 0.01;
			}
			else
				movespeed += 0.1;
		}
	}
	if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
		sprite_index = spr_mach3player;
	if (sprite_index == spr_superjump_cancel && grounded)
		sprite_index = spr_mach3player;
	if (animation_end() && (sprite_index == spr_rollgetup || sprite_index == spr_machdashpad || (sprite_index == spr_mach3hit && ((character == "P" && global.newplayeranim == 1)) || character == "S")))
		sprite_index = spr_mach3player;
	if ((movespeed > 16 && sprite_index != spr_crazyrun) && sprite_index != spr_dive && sprite_index != spr_rollgetup)
	{
		mach4mode = true;
		flash = 1;
		sprite_index = spr_crazyrun;
		with (instance_create(x, y, obj_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	else if (movespeed <= 16 && sprite_index == spr_crazyrun)
		sprite_index = spr_mach3player;
	if (grounded)
		Sjumpcan_doublejump = true;
	if (key_up && sprite_index != spr_machdashpad && sprite_index != spr_dive)
	{
		scr_sound(sound_superjumpcharge1);
		sprite_index = spr_superjumpprep;
		state = states.Sjumpprep;
		hsp = 0;
		image_index = 0;
	}
	if ((!key_sprint && grounded) && sprite_index != spr_machdashpad && Dashpad_buffer <= 0)
	{
		scr_sound(sound_break);
		sprite_index = spr_machslidestart;
		image_index = 0;
		state = states.machslide;
	}
	if ((move == -xscale && grounded) && Dashpad_buffer <= 0)
	{
		scr_sound(sound_maximumspeedstop);
		sprite_index = spr_machslideboost3;
		flash = 0;
		state = states.machslide;
		image_index = 0;
		mach2 = 100;
	}
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
				movespeed = 7;
				vsp = -14;
			}
			else
			{
				movespeed = 8;
				vsp = -5;
			}
			movespeed += other.movespeed;
		}
	}
	if (key_down && !place_meeting(x, y, obj_dashpad))
	{
		flash = 0;
		state = states.machroll;
		if (!grounded)
			sprite_index = spr_dive;
		image_index = 0;
		sprite_index = spr_machroll;
		vsp = 10;
	}
	if (sprite_index == spr_dive && grounded)
		sprite_index = spr_mach3player;
	if (!key_down && sprite_index == spr_dive && !grounded)
	{
		vsp = 15;
		sprite_index = spr_mach3player;
	}
	if (grounded)
		upsideDownJump = false;
	if ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
	{
		if (!upsideDownJump)
		{
			verticalMovespeed = movespeed;
			if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
				verticalMovespeed -= vsp;
			grabclimbbuffer = 0;
			state = states.climbwall;
		}
		else
		{
			if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
				verticalMovespeed += vsp;
			dir = (move == xscale) ? xscale : -xscale;
			vsp = 0;
			grabclimbbuffer = 0;
			verticalMovespeed = movespeed;
			state = states.climbdownwall;
			xscale *= -1;
		}
	}
	else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
	{
		var _ledge = 0;
		_ledge -= slope_check_up(x + xscale, y, 32);
		_ledge += slope_check_down(x + xscale, y, 3);
		if (_ledge != 0)
			y += _ledge;
		else
		{
			scr_sound(sound_maximumspeedland);
			camera_shake(20, 40);
			image_speed = 0.35;
			sprite_index = spr_mach3hitwall;
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
	}
	if (sprite_index == spr_crazyrun && !instance_exists(obj_crazyrunothereffect))
		instance_create(x, y, obj_crazyrunothereffect, 
		{
			obj_player: id
		});
	if (!instance_exists(obj_crazyruneffect))
		instance_create(x, y, obj_crazyruneffect, 
		{
			obj_player: id
		});
	if (!instance_exists(obj_chargeeffect) && sprite_index != spr_dive)
		instance_create(x, y, obj_chargeeffect, 
		{
			obj_player: id
		});
	if (!instance_exists(obj_superdashcloud) && grounded)
		instance_create(x, y, obj_superdashcloud, 
		{
			obj_player: id
		});
	if (sprite_index == spr_mach3player)
		image_speed = 0.4;
	if (sprite_index == spr_crazyrun)
		image_speed = 0.55;
	if (sprite_index == spr_rollgetup)
		image_speed = 0.35;
	if (sprite_index == spr_machdashpad)
		image_speed = 0.3;
		if (sprite_index == spr_mach3hit)
		image_speed = 0.35;
	if (sprite_index != spr_dive)
	{
		scr_noise_abilities();
		do_taunt();
		do_grab();
	}
}
