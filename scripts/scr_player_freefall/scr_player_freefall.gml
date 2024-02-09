function state_player_freefall()
{
	if ((key_shoot2 || key_attack2 || key_sprint2) && character == "M")
	{
		state = states.pepperman_pinball
		image_index = 0;
		sprite_index = spr_pepperman_rolling
		var move = key_right - key_left
		if move != 0
			movespeed = move * 12
		else
			movespeed = choose(12, -12)
		if grounded
			vsp = -16
		exit;
	}
	landAnim = 1;
	if (verticalMovespeed >= 2)
	{
		verticalMovespeed += 0.5;
		if (verticalMovespeed > 17 && !instance_exists(obj_piledrivereffect))
			instance_create(x, y, obj_piledrivereffect, 
			{
				obj_player: id
			});
	}
	verticalMovespeed += grav;
	verticalMovespeed = clamp(verticalMovespeed, 15, 40);
	vsp = verticalMovespeed;
	freefallsmash += (verticalMovespeed / 15);
	move = key_left + key_right;
	if (!grounded)
	{
		if (sprite_index != obj_player.spr_outofcontrolfall)
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
	if (sprite_index != obj_player.spr_outofcontrolfall)
	{
		if (sprite_index == spr_pizzelle_groundpoundprep)
			sprite_index = spr_pizzelle_groundpound;
		if (sprite_index == spr_pizzelle_bodyslamstart)
			sprite_index = spr_pizzelle_bodyslamfall;
		if (global.treat)
			sprite_index = spr_donutSlam;
	}
	if (grounded && (freefallsmash < 10 || !place_meeting(x, y + vsp, obj_metalblock)) && !place_meeting(x, y + vsp, obj_destructibles))
	{
		if (slopeCheck(x, y) && !place_meeting(x, y, obj_dashpad))
		{
			state = states.machroll;
			sprite_index = spr_crouchslip;
			if (freefallsmash > 20)
				movespeed = 12;
			else
				movespeed = 8;
			if !place_meeting(x, y, obj_grindRail_Slope)
				xscale = -slopeMomentum_direction();
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
		}
		else
		{
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
			if (sprite_index == spr_pizzelle_groundpound)
				sprite_index = spr_pizzelle_groundpoundland;
			if (sprite_index == spr_donutSlam)
				sprite_index = spr_donutSlam_land;
			if (sprite_index == spr_pizzelle_bodyslamfall)
				sprite_index = spr_pizzelle_bodyslamland;
		}
	}
	image_speed = 0.35;
	if (freefallsmash >= 10)
	{
		if (!instance_exists(groundpoundEffect))
			groundpoundEffect = instance_create(x, y, obj_groundpoundeffect, 
			{
				obj_player: id
			});
	}
}
