function state_player_cottonspring()
{
	grav = 0
	static cotton_afterimagetimer = 6;
	image_speed = 0.35;
	movespeed = lerp(movespeed, 0, 0.01)
	verticalMovespeed = lerp(verticalMovespeed, 14, 0.01)
	vsp = verticalMovespeed;
	hsp = movespeed
	sprite_index = spr_cotton_drill;
	var _futurex = x + hsp
	var _futurey = y + vsp
	if (place_meeting_solid(_futurex, _futurey, obj_solid) && (!place_meeting_slope(_futurex, _futurey) && (!place_meeting(_futurex, _futurey, obj_destructibles) && !place_meeting(_futurex, _futurey, obj_chocofrog))))
	{
		if place_meeting_solid(_futurex, y, obj_solid)
			hsp = -hsp
		if place_meeting_solid(x, _futurey, obj_solid)
			vsp = -vsp
		if (sign(hsp) == sign(movespeed) && sign(vsp) == sign(verticalMovespeed))
		{
			hsp = -hsp
			vsp = -vsp
		}
		verticalMovespeed = vsp
		movespeed = hsp
		scr_sound(sound_bump)
	}
	draw_angle = point_direction(x, y, x + hsp, y + vsp) + 90
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_chocofrog))
	{
		doublejumped = 0;
		if (slopeCheck(x, y))
		{
			movespeed = (vsp / 20) * 12;
			hsp = movespeed
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
	if (key_attack2 && sprite_index != spr_cotton_attack && groundedcot == 1 && !place_meeting(x, y, obj_cottonspring))
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
		hsp = movespeed
		grav = 0.2;
		grounded = false;
		scr_sound(sfx_cottonattack);
		groundedcot = 0;
	}
	if (key_jump && !grounded)
	{
		doublejumped = 1;
		movespeed = 0;
		hsp = movespeed
		state = states.cotton;
		vsp = -10;
		verticalMovespeed = vsp
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
	if place_meeting(x + hsp, y + vsp, obj_cottonsolid)
	{
		state = states.cottonswim
		sprite_index = spr_cotton_drill
		var _hdir = sign(movespeed)
		var _vdir = sign(verticalMovespeed)
		movespeed = (max(movespeed * _hdir, 14)) * _hdir
		verticalMovespeed = (max(verticalMovespeed * _vdir, 14)) * _vdir
	}
	if (cotton_afterimagetimer > 0)
		cotton_afterimagetimer--;
	else
		cotton_afterimagetimer = 6;
}
