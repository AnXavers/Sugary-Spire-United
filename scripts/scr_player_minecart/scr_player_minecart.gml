function state_player_minecart()
{
	move = key_left + key_right;
	var _xscale = xscale;
	if (place_meeting(x, y + 1, obj_minecartRail_Slope))
	{
		with (instance_place(x, y + 1, obj_minecartRail_Slope))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (_xscale == sign(image_xscale))
			{
				if (other.movespeed > 5)
					other.movespeed -= (0.15 * slope_acceleration);
			}
			else if (_xscale == -sign(image_xscale))
			{
				if (other.movespeed < 20)
					other.movespeed += (0.2 * slope_acceleration);
			}
		}
	}
	if (move == 0 && movespeed < 5)
		movespeed += 0.1;
	if ((move != 0 && move != xscale) && movespeed > 3 && Dashpad_buffer <= 0)
		movespeed -= 0.05;
	if ((move != 0 && move == xscale) && movespeed < 14)
		movespeed += 0.1;
	movespeed = clamp(movespeed, 0, 15);
	hsp = xscale * movespeed;
	if (movespeed >= 14 && !instance_exists(obj_chargeeffect))
		instance_create(x + (32 * xscale), y, obj_chargeeffect, 
		{
			obj_player: id
		});
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock) && !place_meeting(x + xscale, y, obj_chocofrog))
	{
		sprite_index = spr_mach3hitwall;
		state = states.bump;
		hsp = 2.5 * -xscale;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x, y, obj_bombexplosionharmless);
		audio_stop_sound(sfx_railgrind);
		for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
		{
			with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, 9), obj_debris))
			{
				sprite_index = spr_minecartdebris;
				image_index = i;
				vsp = floor(random_range(-5, -9));
				hsp = floor(random_range(-5, 7));
			}
		}
	}
	if (key_jump && !grounded)
	{
		state = states.mach2;
		vsp = -12;
		image_index = 0;
		sprite_index = spr_mach2jump;
		with (instance_create(x, y, obj_minedummycart))
		{
			image_xscale = other.xscale;
			movespeed = other.movespeed;
		}
	}
	else if (key_jump && grounded)
	{
		vsp = -10;
		image_index = 0;
		sprite_index = obj_player.spr_minecartjump;
	}
	if (grounded && !place_meeting(x, y + 1, obj_minecartRail) && !place_meeting(x, y + 1, obj_minecartRail_Slope))
	{
		movespeed -= 0.4;
		if (movespeed <= 0)
		{
			with (instance_create(x, y, obj_minedummycart))
			{
				image_xscale = other.xscale;
				image_index = 0;
				sprite_index = spr_minecartend;
				movespeed = 0;
			}
			state = states.machslide;
			vsp = -8;
			movespeed = 6;
			sprite_index = spr_pizzelle_hurtroll;
		}
	}
	var groundedlandsprite = (movespeed >= 12) ? obj_player.spr_minecartfastland : obj_player.spr_minecartland;
	var groundedsprite = (movespeed >= 12) ? obj_player.spr_minecartfast : obj_player.spr_minecart_player;
	if (!grounded)
	{
		if (sprite_index != obj_player.spr_minecartjump)
			sprite_index = obj_player.spr_minecartfall;
		if (sprite_index == obj_player.spr_minecartjump && animation_end())
			sprite_index = obj_player.spr_minecartfall;
	}
	if (grounded)
	{
		if (sprite_index != groundedlandsprite && (sprite_index == obj_player.spr_minecartfall || sprite_index == obj_player.spr_minecartjump))
		{
			sprite_index = groundedlandsprite;
			image_index = 0;
		}
		if (sprite_index == groundedlandsprite && animation_end())
			sprite_index = groundedsprite;
		if (sprite_index != groundedsprite && (sprite_index == obj_player.spr_minecartfast || sprite_index == obj_player.spr_minecart_player))
			sprite_index = groundedsprite;
	}
	if (sprite_index == obj_player.spr_minecartfast || sprite_index == obj_player.spr_minecart_player)
		image_speed = clamp(0.5 * (movespeed / 12), 0.35, 0.6);
	else
		image_speed = 0.35;
}
