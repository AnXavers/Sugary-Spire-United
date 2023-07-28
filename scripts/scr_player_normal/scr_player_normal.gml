function state_player_normal()
{
	roomname = room_get_name(room);
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 2;
		facehurt = 0;
	}
	mach2 = 0;
	move = key_left + key_right;
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = move * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (move * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (move * movespeed) + 5;
	if ((machslideAnim == 0 && landAnim == 0 && shotgunAnim == 0) && sprite_index != spr_coneboy_spit)
	{
		if (move == 0 && sprite_index != spr_coneboy_spit && !key_taunt)
		{
			if (idle < 400)
				idle++;
			if (idle >= 300 && floor(image_index) == (image_number - 1))
			{
				shotgunAnim = 0;
				facehurt = 0;
				idle = 0;
				image_index = 0;
			}
			if (sprite_index != spr_caneidle && global.panic == 0 && sprite_index != spr_angryidle && !key_taunt)
			{
				if (idle >= 300 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3)
				{
					randomise();
					idleanim = random_range(0, 100);
					if (idleanim <= 25)
						sprite_index = spr_idle1;
					else if (idleanim > 25 && idleanim < 50)
						sprite_index = spr_idle2;
					else if (idleanim > 50 && idleanim < 75)
						sprite_index = spr_idle3;
					else if (idleanim > 75)
						sprite_index = spr_idle4;
					image_index = 0;
				}
				if (idle < 300)
				{
					if (facehurt == 0)
					{
						if (windingAnim < 1800 || angry == 1)
						{
							start_running = 1;
							movespeed = 0;
							if (character == "P")
							{
								if (global.cane == 1)
									sprite_index = spr_caneidle;
								else
								{
									sprite_index = spr_idle;
									if (global.levelname == "fudge")
										sprite_index = spr_player_fudgeidle;
									if (global.levelname == "dance")
										sprite_index = spr_player_danceidle;
								}
							}
							else if (character == "N")
								sprite_index = spr_idle;
							else
								sprite_index = spr_idle;
						}
						else if (character == "P" || character == "N")
						{
							idle = 0;
							windingAnim--;
							sprite_index = spr_player_winding;
						}
					}
					else if (facehurt == 1 && character == "P")
					{
						windingAnim = 0;
						if (sprite_index != spr_player_facehurtup && sprite_index != spr_player_facehurt)
							sprite_index = spr_player_facehurtup;
						if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_facehurtup)
							sprite_index = spr_player_facehurt;
					}
				}
			}
			if (global.panic == 1)
				sprite_index = spr_escapeidle;
			if (instance_exists(obj_coneball) && sprite_index == spr_escapeidle)
				sprite_index = spr_timesupidle;
		}
		if (move != 0 && !key_taunt)
		{
			machslideAnim = 0;
			idle = 0;
			facehurt = 0;
			if (angry == 1 || global.stylethreshold > 3)
				sprite_index = spr_angrywalk;
			else if (global.cane == 1)
				sprite_index = spr_canewalk;
			else if (global.levelname == "dance")
				sprite_index = spr_player_dancewalk;
			else
				sprite_index = spr_move;
		}
		if (key_taunt)
			sprite_index = spr_player_breakdance;
		if (move != 0)
			xscale = move;
	}
	if (landAnim == 1 && sprite_index != spr_coneboy_spit)
	{
		if (shotgunAnim == 0)
		{
			if (move == 0)
			{
				movespeed = 0;
				sprite_index = spr_land;
				if (floor(image_index) == (image_number - 1))
					landAnim = 0;
			}
			if (move != 0)
			{
				sprite_index = spr_land2;
				if (floor(image_index) == (image_number - 1))
				{
					landAnim = 0;
					if (global.cane == 0)
						sprite_index = spr_move;
					else
						sprite_index = spr_canewalk;
					image_index = 0;
				}
			}
		}
		if (shotgunAnim == 1)
		{
			sprite_index = spr_shotgun_land;
			if (floor(image_index) == (image_number - 1))
			{
				landAnim = 0;
				if (global.cane == 0)
					sprite_index = spr_move;
				else
					sprite_index = spr_canewalk;
				image_index = 0;
			}
		}
	}
	if (machslideAnim == 1)
	{
		sprite_index = spr_machslideend;
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideend)
			machslideAnim = 0;
	}
	if (sprite_index == spr_player_shotgun && floor(image_index) == (image_number - 1))
		sprite_index = spr_shotgun_idle;
	if (landAnim == 0)
	{
		if (shotgunAnim == 1 && move == 0 && sprite_index != spr_player_shotgun)
			sprite_index = spr_shotgun_idle;
		else if (shotgunAnim == 1 && sprite_index != spr_player_shotgun)
			sprite_index = spr_shotgun_walk;
	}
	if (scr_solid(x + move, y, true))
		movespeed = 0;
	jumpstop = 0;
	if (!grounded && !key_jump)
	{
		if (shotgunAnim == 0)
			sprite_index = spr_fall;
		else
			sprite_index = spr_shotgun_fall;
		jumpAnim = 0;
		state = 60;
		image_index = 0;
	}
	if (character == "C" && key_attack && inhalingenemy == 0 && substate == 0)
		state = 115;
	if (character == "C" && inhalingenemy == 1 && key_down && grounded)
	{
		if (storedinhalebaddie == "obj_knight")
			substate = 1;
		else if (storedinhalebaddie == "obj_googlyjuice")
			substate = 2;
		scr_sound(sfx_coneboyswallow);
		inhalingenemy = false;
	}
	if (character == "C" && inhalingenemy == 1 && key_slap && grounded)
	{
		sprite_index = spr_coneboy_spit;
		instance_create(x, y, obj_coneboyprojectile);
		inhalingenemy = false;
	}
	if (sprite_index == spr_coneboy_spit)
	{
		hsp = xscale * movespeed;
		movespeed = -5;
		move = 0;
	}
	if (character == "C" && substate == 0 && key_shoot2 && headless == 0 && !instance_exists(obj_coneboyhead))
	{
		if (move == 0)
			movespeed = 0;
		else
			movespeed = 3;
		state = 116;
		image_index = 0;
		sprite_index = spr_coneboy_kick;
		headless = true;
		with (instance_create(x, y, obj_coneboyhead))
		{
			playerID = other.id;
			image_xscale = other.xscale;
			movespeed = 10;
			if (!playerID.key_up)
				vsp = -6;
			else
				vsp = -12;
		}
		scr_sound(sfx_coneboykick);
		audio_sound_pitch(sfx_coneboykick, 1.2);
		headless = 1;
	}
	if (sprite_index == spr_coneboy_spit && animation_end())
		sprite_index = spr_idle;
	if (key_jump && grounded && !key_down)
	{
		scr_sound(sound_jump);
		sprite_index = spr_jump;
		if (shotgunAnim == 1)
			sprite_index = spr_shotgun_jump;
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -12;
		state = 60;
		image_index = 0;
		jumpAnim = 1;
	}
	if (grounded && input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0)
	{
		scr_sound(sound_jump);
		sprite_index = spr_jump;
		if (shotgunAnim == 1)
			sprite_index = spr_shotgun_jump;
		instance_create(x, y, obj_highjumpcloud2);
		stompAnim = 0;
		vsp = -11;
		state = 60;
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		freefallstart = 0;
	}
	if (move != 0)
	{
		if (movespeed < 7)
			movespeed += 0.5;
		else if (floor(movespeed) == 7)
			movespeed = 7;
	}
	else
		movespeed = 0;
	if (movespeed > 7)
		movespeed -= 0.1;
	if (key_slap2 && shotgunAnim == 1 && !instance_exists(obj_cutscene_upstairs))
	{
		global.ammo -= 1;
		sprite_index = spr_player_shotgun;
		state = 33;
		image_index = 0;
	}
	momemtum = 0;
	if (move != 0)
	{
		xscale = move;
		if (movespeed < 3 && move != 0)
			image_speed = 0.35;
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else
		image_speed = 0.35;
	if ((key_down && grounded) || scr_solid(x, y - 3))
	{
		if (slopeCheck(x, y) && (abs(scr_checkSlopeAngle()) % 90) >= 45)
		{
			movespeed = hsp;
			xscale = -slopeMomentum_direction();
			state = 96;
			sprite_index = spr_tumblestart;
			scr_sound(sound_tumblestart);
		}
		else
		{
			state = 65;
			landAnim = 0;
			crouchAnim = 1;
			image_index = 0;
			idle = 0;
		}
	}
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (sprite_index == spr_player_downslopes || sprite_index == spr_player_upslopes))
		instance_create(x, y + 43, obj_cloudeffect);
	do_taunt();
	do_grab();
	if (global.cane == 1)
	{
		if (scr_solid(x + sign(hsp), y) && (xscale == 1 && (move == 1 && !place_meeting(x + 1, y, obj_slope))))
			movespeed = 0;
		if (scr_solid(x + sign(hsp), y) && (xscale == -1 && (move == -1 && !place_meeting(x - 1, y, obj_slope))))
			movespeed = 0;
		if (key_jump2 && grounded && canrebound == 0)
		{
			sprite_index = spr_player_canefall;
			vsp = -15;
			canrebound = 1;
			state = 60;
		}
		if (key_slap2 && !key_down && suplexmove == 0 && shotgunAnim == 0)
		{
			scr_sound(sound_suplex1);
			instance_create(x, y, obj_slaphitbox);
			suplexmove = 1;
			vsp = 0;
			instance_create(x, y, obj_jumpdust);
			image_index = 0;
			sprite_index = spr_canesuplex;
			state = 17;
			if (character == "DEEZNUTS")
				vsp = -5;
		}
	}
	if (key_shoot2 && key_up && breakdanceammo > 0)
	{
		state = 100;
		sprite_index = spr_player_breakdancebeach;
		image_index = 0;
		breakdanceammo -= 1;
	}
	if (key_slap2 && character == "G")
	{
		state = 118;
		image_index = 0;
		sprite_index = spr_gumbob_brew_pulloutdrink;
	}
	if (key_attack && grounded && !scr_solid(x + xscale, y, true))
	{
		mach2 = 0;
		if (movespeed < 6)
			movespeed = 6;
		sprite_index = spr_mach1;
		jumpAnim = 1;
		state = 69;
		image_index = 0;
	}
	if (character == "C")
	{
		if (substate == 1)
		{
			if (sprite_index == spr_idle || sprite_index == spr_idle2 || sprite_index == spr_idle3)
				sprite_index = spr_coneboy_sword_idle;
			if (key_up && key_slap2)
			{
				vsp = -15;
				state = 89;
				suplexmove = true;
				sprite_index = spr_coneboy_sworduppercut;
				instance_create(x, y, obj_coneboyswordhitbox);
			}
			if (key_attack)
			{
				instance_create(x, y, obj_coneboyswordhitbox);
				sprite_index = spr_coneboy_sworddash;
				state = 115;
			}
		}
		if (substate == 2)
		{
			if (key_shoot2 && instance_number(obj_coneboyjuice) < 3)
			{
				image_index = 0;
				sprite_index = spr_coneboy_juicespit;
				state = 116;
				instance_create(x, y, obj_coneboyjuice);
			}
			if (key_attack)
			{
				sprite_index = spr_coneboy_juicewave;
				state = 115;
				movespeed = 6;
			}
		}
	}
}
