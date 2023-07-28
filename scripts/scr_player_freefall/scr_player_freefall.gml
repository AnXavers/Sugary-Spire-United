function state_player_freefall()
{
	landAnim = 1;
	if (verticalMovespeed >= 2)
	{
		verticalMovespeed += 0.5;
		if (verticalMovespeed > 17 && !instance_exists(obj_piledrivereffect))
			instance_create(x, y, 277, 
			{
				playerID: id
			});
	}
	verticalMovespeed += grav;
	verticalMovespeed = clamp(verticalMovespeed, 15, 40);
	vsp = verticalMovespeed;
	freefallsmash += (verticalMovespeed / 15);
	move = key_left + key_right;
	if (!grounded)
	{
		if (sprite_index != spr_player_outofcontrolfall)
			hsp = move * movespeed;
		else
			hsp = 0;
		if (move != xscale && momemtum == 1 && movespeed != 0)
			movespeed -= 0.05;
		if (movespeed == 0)
			momemtum = 0;
		if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
		{
			movespeed = 0;
			mach2 = 0;
		}
		if (move != 0 && movespeed < 7)
			movespeed += 0.25;
		if (movespeed > 7)
			movespeed -= 0.05;
		if (scr_solid(x + move, y) && move != 0)
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
		if (move != 0)
			xscale = move;
	}
	if (sprite_index != spr_player_outofcontrolfall)
	{
		if (sprite_index == spr_bodyslamstart)
			sprite_index = spr_bodyslamfall;
		if (sprite_index == spr_bombdropstart)
			sprite_index = spr_bombdropfall;
		if (global.treat)
			sprite_index = spr_player_donutSlam;
	}
	if (grounded && (freefallsmash < 10 || !place_meeting(x, y + vsp, obj_metalblock)) && !place_meeting(x, y + vsp, obj_destructibles))
	{
		if (slopeCheck(x, y) && !place_meeting(x, y, obj_dashpad))
		{
			state = 31;
			sprite_index = spr_crouchslip;
			if (freefallsmash > 20)
				movespeed = 12;
			else
				movespeed = 8;
			xscale = -slopeMomentum_direction();
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
		}
		else
		{
			scr_sound(sound_maximumspeedland);
			image_index = 0;
			state = 75;
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
			if (sprite_index == spr_bodyslamfall)
				sprite_index = spr_bodyslamland;
			if (sprite_index == spr_player_donutSlam)
				sprite_index = spr_player_donutSlam_land;
			if (sprite_index == spr_bombdropfall)
				sprite_index = spr_bombdropland;
		}
	}
	image_speed = 0.35;
	if (freefallsmash >= 10)
	{
		if (!instance_exists(groundpoundEffect))
			groundpoundEffect = instance_create(x, y, 472, 
			{
				playerID: id
			});
	}
}
