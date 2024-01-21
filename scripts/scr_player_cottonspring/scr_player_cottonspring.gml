function state_player_cottonspring()
{
	static cotton_afterimagetimer = 6;
	image_speed = 0.35;
	if (verticalMovespeed < 9)
		verticalMovespeed = approach(verticalMovespeed, 20, 2);
	else
		verticalMovespeed = approach(verticalMovespeed, 20, 0.5);
	vsp = verticalMovespeed;
	sprite_index = spr_cotton_drill;
	var dir = (point_direction(x, y, x + hsp, y + vsp) + 90);
	image_angle = dir
	if !audio_is_playing(sfx_spring)
	{
		doublejumped = 1;
		state = states.cotton;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
	}
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_chocofrog))
	{
		doublejumped = 0;
		if (slopeCheck(x, y))
		{
			movespeed = (verticalMovespeed / 20) * 12;
			vsp = 3;
			state = states.cottonroll;
			image_index = 0;
			sprite_index = spr_cotton_roll;
			if (scr_slope_ext(x, y + 1) && !scr_solid_slope(x, y + 1))
			{
				with (instance_place(x, y + 1, obj_slope))
					other.xscale = -sign(image_xscale);
				with (instance_place(x, y + 1, obj_slopePlatform))
					other.xscale = -sign(image_xscale);
			}
		}
		else
		{
			state = states.cotton;
			sprite_index = spr_cotton_land;
			vsp = 0;
			movespeed = 0;
			image_index = 0;
		}
	}
	if (key_attack2 && sprite_index != spr_cotton_attack && groundedcot == 1)
	{
		state = states.cotton;
		flash = 1;
		image_index = 0;
		sprite_index = spr_cotton_attack;
		if (movespeed < 8)
			movespeed = 8;
		if (!grounded)
			vsp = -5;
		else
			vsp = 0;
		grav = 0.2;
		grounded = false;
		scr_sound(sfx_cottonattack);
		groundedcot = 0;
	}
	if (key_jump && !grounded && doublejumped == 0)
	{
		doublejumped = 1;
		movespeed = 0;
		state = states.cotton;
		vsp = -10;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
		instance_create(x, y, obj_highjumpcloud2);
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cottonpoof;
		}
		scr_sound(sfx_cottonjump);
	}
	if (cotton_afterimagetimer > 0)
		cotton_afterimagetimer--;
	else
		cotton_afterimagetimer = 6;
}
