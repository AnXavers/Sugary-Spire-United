function state_player_climbwall()
{
	hsp = xscale;
	if (windingAnim < 200)
		windingAnim++;
	jumpstop = false;
	move = key_right + key_left;
	suplexmove = 0;
	vsp = -verticalMovespeed;
	if global.moveset == 2 && verticalMovespeed > 0
		verticalMovespeed -= 0.075
	if (vsp != 0 && place_meeting(x + xscale, y, obj_molassesWall))
	{
		if ((floor(image_index) % 4) == 0)
		{
			with (instance_create(x + (16 * xscale), y + 43, obj_debris))
			{
				sprite_index = spr_molassesgoop;
				image_index = irandom_range(0, 5);
			}
		}
	}
	var _maxspeed = (move == xscale) ? 20 : 12;
	if (verticalMovespeed < _maxspeed && !place_meeting(x + xscale, y, obj_molassesWall) && global.moveset != 2)
		verticalMovespeed += 0.1;
	else if (place_meeting(x + xscale, y, obj_molassesWall) || global.moveset == 2)
	{
		if (verticalMovespeed > 0)
			verticalMovespeed -= 0.05;
	}
	if (verticalMovespeed > 0)
	{
		if (movespeed < 24)
		{
			if (!mach4mode)
				movespeed += 0.025;
			else
				movespeed += 0.1;
		}
	}
	if (movespeed > 16)
		mach4mode = true;
	crouchslideAnim = 1;
	sprite_index = spr_climbwall;
	if substate == 2 && character == "C"
	sprite_index = spr_coneboy_juicewallclimb
	if (verticalMovespeed <= 0)
	{
		movespeed = 0;
		mach2 = 0;
	}
	if (grabclimbbuffer > 0)
		grabclimbbuffer--;
	if (!key_sprint && grabclimbbuffer <= 0)
	{
		movespeed = 0;
		vsp /= 2;
		state = states.jump;
		sprite_index = spr_pizzelle_fall;
		slideHsp = -9 * xscale;
	}
	if (!scr_solid(x + xscale, y))
	{
		instance_create(x, y, obj_jumpdust);
		vsp = 0;
		if (verticalMovespeed < 6)
			verticalMovespeed = 6;
		if (verticalMovespeed < 12)
		{
			state = states.mach2;
			movespeed = verticalMovespeed;
		}
		else if (verticalMovespeed >= 12)
		{
			state = states.mach3;
			sprite_index = spr_mach3player;
			movespeed = verticalMovespeed;
		}
	}
	if ((grounded && verticalMovespeed <= 0) || verticalMovespeed <= 0)
	{
		state = states.jump
		sprite_index = spr_pizzelle_fall
	}
	if ((scr_solid(x, y - 1, true) && vsp <= 0 && !place_meeting(x, y - 1, obj_destructibles)) && !scr_slope_ext(x + xscale, y))
	{
		sprite_index = spr_ceilingcrash;
		scr_sound(sound_maximumspeedland);
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = 0;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
	}
	else if (scr_solid(x, y - 1, true) && vsp <= 0 && !place_meeting(x, y - 1, obj_destructibles))
	{
		state = states.climbceiling;
		vsp = -1;
		if (verticalMovespeed < 6)
			verticalMovespeed = 6;
		if (verticalMovespeed < 12)
			sprite_index = spr_mach2ceiling;
		else if (verticalMovespeed >= 12)
			sprite_index = spr_mach3ceiling;
		dir = (move == xscale) ? xscale : -xscale;
		movespeed = verticalMovespeed;
	}
	if (key_jump && key_sprint)
	{
		if (movespeed >= 12 && !place_meeting(x + xscale, y, obj_molassesWall) && character != "S")
		{
			image_index = 0;
			sprite_index = spr_mach3jump;
			vsp = -9;
			jumpstop = false;
			state = states.mach3;
			xscale *= -1;
		}
		else if (movespeed >= 6 && !place_meeting(x + xscale, y, obj_molassesWall))
		{
			if character == "S"
				movespeed = clamp(movespeed, 0, 8)
			image_index = 0;
			sprite_index = spr_secondjump1;
			if character == "S" || character == "T"
				sprite_index = spr_walljumpstart;
			vsp = -9;
			jumpstop = false;
			state = states.mach2;
			xscale *= -1;
		}
		else
		{
			sprite_index = spr_mach2jump;
			if character == "S" || character == "T"
				sprite_index = spr_walljumpstart;
			movespeed = clamp(movespeed, 6, 10);
			jumpstop = false;
			vsp = -9;
			state = states.mach2;
			xscale *= -1;
			with (instance_create(x + (16 * -xscale), y + 43, obj_debris))
			{
				sprite_index = spr_molassesgoop;
				image_index = irandom_range(0, 5);
			}
		}
		instance_create(x, y, obj_jumpdust);
		if (!playedjumpsound)
		{
			scr_sound(sound_jump);
			playedjumpsound = mu_rankd;
		}
	}
	if (grounded && verticalMovespeed < 0)
	{
		state = states.jump;
		sprite_index = spr_pizzelle_fall;
		vsp = -verticalMovespeed;
	}
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect))
		instance_create(x, y + 43, obj_cloudeffect);
}
function state_player_climbceiling()
{
	if (windingAnim < 2000)
		windingAnim++;
	move = key_right + key_left;
	if (move != dir && dir != -xscale)
		dir = -xscale;
	hsp = movespeed * -xscale;
	vsp = 0;
	if (movespeed < 24 && move == dir)
	{
		if (!mach4mode)
			movespeed += 0.025;
		else
			movespeed += 0.1;
	}
	if (movespeed < 12)
		sprite_index = spr_mach2ceiling;
	else if (movespeed >= 12)
	{
		if (sprite_index == spr_mach2ceiling)
			flash = true;
		sprite_index = spr_mach3ceiling;
	}
	if (!place_meeting_collision(x, y - 31))
	{
		vsp = 0;
		xscale *= -1;
		if (movespeed < 12)
			state = states.mach2;
		else if (movespeed >= 12)
		{
			state = states.mach3;
			sprite_index = spr_mach3player;
		}
	}
	if (move == -dir)
	{
		vsp = 0;
		xscale *= -1;
		slope_angle = 180;
		if (movespeed < 12)
		{
			scr_sound(sound_maximumspeedstop);
			sprite_index = spr_machslideboost;
			image_index = 0;
			state = states.machslide;
		}
		else
		{
			scr_sound(sound_maximumspeedstop);
			sprite_index = spr_machslideboost3;
			flash = 0;
			state = states.machslide;
			image_index = 0;
			mach2 = 100;
		}
	}
	if (!key_sprint)
	{
		vsp = 0;
		xscale *= -1;
		slope_angle = 180;
		scr_sound(sound_break);
		sprite_index = spr_machslidestart;
		image_index = 0;
		state = states.machslide;
	}
	if (place_meeting_slope(x, y - 1) && scr_solid(x - xscale, y, true) && !place_meeting(x - xscale, y, obj_destructibles) && !(place_meeting(x - xscale, y, obj_metalblock) && movespeed >= 12))
	{
		dir = (move == xscale) ? xscale : -xscale;
		vsp = 0;
		verticalMovespeed = movespeed;
		state = states.climbdownwall;
	}
	else if (scr_solid(x - xscale, y, true) && !place_meeting(x - xscale, y, obj_destructibles) && !(place_meeting(x - xscale, y, obj_metalblock) && movespeed >= 12))
	{
		vsp = 0;
		scr_sound(sound_maximumspeedland);
		camera_shake(20, 40);
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
		hsp = -2.5 * -xscale;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + (10 * -xscale), y + 10, obj_bumpeffect);
	}
	if (key_jump && key_sprint)
	{
		if (movespeed >= 12 && character != "S")
		{
			upsideDownJump = true;
			image_index = 0;
			sprite_index = spr_mach3jump;
			vsp = 5;
			jumpstop = false;
			state = states.mach3;
			xscale *= -1;
		}
		else
		{
			upsideDownJump = true;
			image_index = 0;
			sprite_index = spr_secondjump1;
			vsp = 5;
			jumpstop = false;
			state = states.mach2;
			xscale *= -1;
		}
		instance_create(x, y, obj_jumpdust);
		if (!playedjumpsound)
		{
			scr_sound(sound_jump);
			playedjumpsound = mu_rankd;
		}
	}
	image_speed = 0.6;
}
function state_player_climbdownwall()
{
	hsp = -xscale;
	upsideDownJump = false;
	if (windingAnim < 200)
		windingAnim++;
	move = key_right + key_left;
	suplexmove = 0;
	vsp = verticalMovespeed;
	if (vsp != 0 && place_meeting(x - xscale, y, obj_molassesWall))
	{
		if ((floor(image_index) % 4) == 0)
		{
			with (instance_create(x + (16 * -xscale), y + 43, obj_debris))
			{
				sprite_index = spr_molassesgoop;
				image_index = irandom_range(0, 5);
			}
		}
	}
	var _maxspeed = (move == xscale) ? 25 : 14;
	if (verticalMovespeed < _maxspeed && !place_meeting(x - xscale, y, obj_molassesWall))
		verticalMovespeed += 0.1;
	else if (place_meeting(x - xscale, y, obj_molassesWall))
	{
		if (verticalMovespeed > 0)
			verticalMovespeed -= 0.05;
	}
	if (verticalMovespeed > 0)
	{
		if (movespeed < 24)
		{
			if (!mach4mode)
				movespeed += 0.025;
			else
				movespeed += 0.1;
		}
	}
	if (movespeed > 16)
		mach4mode = true;
	crouchslideAnim = 1;
	sprite_index = spr_climbdownwall;
	if (!key_sprint && grabclimbbuffer <= 0)
	{
		xscale *= -1;
		movespeed = 0;
		vsp /= 2;
		state = states.jump;
		sprite_index = spr_pizzelle_fall;
		slideHsp = -9 * xscale;
	}
	if (!scr_solid(x - (xscale * 3), y))
	{
		instance_create(x, y, obj_jumpdust);
		xscale *= -1;
		vsp = verticalMovespeed;
		state = states.freefall;
		freefallsmash = 10;
	}
	if (scr_solid(x, y + 1) && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_destructibles))
	{
		if (scr_slope_ext(x, y + 1))
		{
			if (verticalMovespeed < 6)
				verticalMovespeed = 6;
			if (verticalMovespeed >= 6 && verticalMovespeed < 12)
			{
				state = states.mach2;
				movespeed = verticalMovespeed;
			}
			else if (verticalMovespeed >= 12)
			{
				state = states.mach3;
				sprite_index = spr_mach3player;
				movespeed = verticalMovespeed;
			}
		}
		else
		{
			xscale *= -1;
			scr_sound(sound_maximumspeedland);
			image_index = 0;
			state = states.freefallland;
			jumpAnim = 1;
			jumpstop = 0;
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
			combo = 0;
			bounce = 0;
			instance_create(x, y, obj_landcloud);
			freefallstart = 0;
			image_index = 0;
			sprite_index = spr_pizzelle_groundpoundland;
		}
	}
	if (key_jump && key_sprint)
	{
		if (movespeed >= 12 && !place_meeting(x - xscale, y, obj_molassesWall) && character != "S")
		{
			upsideDownJump = true;
			image_index = 0;
			sprite_index = spr_mach3jump;
			vsp = 3;
			jumpstop = false;
			state = states.mach3;
		}
		else if (movespeed >= 6 && !place_meeting(x - xscale, y, obj_molassesWall))
		{
			upsideDownJump = true;
			image_index = 0;
			sprite_index = spr_secondjump1;
			vsp = 3;
			jumpstop = false;
			state = states.mach2;
		}
		else
		{
			upsideDownJump = true;
			sprite_index = spr_mach2jump;
			movespeed = clamp(movespeed, 6, 10);
			jumpstop = false;
			vsp = 3;
			state = states.mach2;
			with (instance_create(x + (16 * -xscale), y + 43, obj_debris))
			{
				sprite_index = spr_molassesgoop;
				image_index = irandom_range(0, 5);
			}
		}
		instance_create(x, y, obj_jumpdust);
		if (!playedjumpsound)
		{
			scr_sound(sound_jump);
			playedjumpsound = mu_rankd;
		}
	}
	image_speed = 0.6;
	if (!instance_exists(obj_cloudeffect))
		instance_create(x, y + 43, obj_cloudeffect);
}
