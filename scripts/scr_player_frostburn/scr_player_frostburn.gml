function state_player_frostburn()
{
	if (grounded)
	{
		if (sprite_index != spr_skatecrouch)
		{
			if (movespeed < 7)
				sprite_index = spr_skateslowwalk;
			else
				sprite_index = spr_skatewalk;
		}
		else if (!key_down && !place_meeting_collision(x, y - 16))
			sprite_index = spr_skatewalk;
	}
	move = key_left + key_right;
	hsp = xscale * movespeed;
	if (movespeed < 3)
		movespeed += 0.1;
	var maxMVSP = 14;
	var minMVSP = 4;
	if (sprite_index == spr_skatecrouch)
	{
		maxMVSP = 8;
		minMVSP = 3;
	}
	if (move == xscale && movespeed < maxMVSP)
		movespeed += 0.1;
	if (move == -xscale && movespeed > minMVSP)
		movespeed -= 0.05;
	if (movespeed > 18 && !groundedSlope)
		movespeed -= 0.5;
	if (movespeed > 3 && sprite_index != spr_skatedive)
		player_slopeMomentum(0.3);
	if ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
	{
		instance_create(x, y, obj_bangeffect);
		xscale *= -1;
	}
	else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
	{
		instance_create(x, y, obj_bangeffect);
		xscale *= -1;
	}
	if (key_jump && grounded && !key_down)
	{
		vsp = -8;
		sprite_index = spr_skatejumpstart;
		image_index = 0;
	}
	if (key_down)
	{
		if (!grounded)
		{
			sprite_index = spr_skatedive;
			vsp = 14;
			if (movespeed < 10)
				movespeed++;
		}
		else
		{
			sprite_index = spr_skatecrouch;
			movespeed--;
			movespeed = max(4, movespeed);
		}
	}
	if (sprite_index == spr_skatejumpstart && animation_end())
		sprite_index = spr_skatejump;
	if (sprite_index == spr_skatedoublejumpstart && animation_end())
		sprite_index = spr_skatedoublejump;
	if (sprite_index == spr_skateland && animation_end())
		sprite_index = spr_skatewalk;
	if (sprite_index == spr_skateslowwalk)
		image_speed = clamp(movespeed / 16, 0.1, 0.5);
	else
		image_speed = 0.35;
}
function state_player_frostburnwallrun()
{
	vsp = -verticalMovespeed;
	verticalMovespeed -= 0.3;
	move = key_left + key_right;
	hsp = 0;
	sprite_index = spr_skatewallrun;
	if (!place_meeting_collision(x + xscale, y))
	{
		instance_create(x, y, obj_jumpdust);
		vsp = 0;
		state = states.frostburn;
		movespeed = verticalMovespeed;
		sprite_index = spr_skatewalk;
	}
	if (key_jump)
	{
		vsp = -9;
		xscale *= -1;
		movespeed = abs(verticalMovespeed);
		movespeed = max(6, movespeed);
		suplexmove = false;
		state = states.frostburn;
		sprite_index = spr_skatejumpstart;
		image_index = 0;
	}
	if (place_meeting_collision(x, y - 1, 8))
	{
		instance_create(x, y, obj_bangeffect);
		movespeed = verticalMovespeed;
		state = states.frostburnbump;
		doublejump = true;
		movespeed /= 2;
	}
	if (grounded)
	{
		movespeed = 0;
		if (groundedSlope)
		{
			movespeed = abs(verticalMovespeed);
			movespeed += 2;
		}
		xscale *= -1;
		state = states.frostburn;
	}
	image_speed = 0.35;
}
function state_player_frostburnspin()
{
	var _h = floor(image_index) >= (image_number - 5);
	hsp = xscale * movespeed;
	move = key_left + key_right;
	if (!_h)
		vsp = 0;
	image_speed = 0.35;
	sprite_index = spr_skatespin;
	var maxSpd = 8;
	if (_h)
		maxSpd = 16;
	if ((move == 0 || move == xscale) && movespeed > 0)
		movespeed = approach(movespeed, maxSpd, 0.7);
	else if (move != 0 && move != xscale)
		movespeed = approach(movespeed, -maxSpd, 0.9);
	if (animation_end())
	{
		state = states.frostburn;
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		movespeed = abs(movespeed);
		if (movespeed < 5)
			movespeed = 5;
	}
	if ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
	{
		state = states.frostburnwallrun;
		verticalMovespeed = movespeed;
	}
	else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
	{
		instance_create(x, y, obj_bangeffect);
		xscale *= -1;
		movespeed /= 2;
	}
}
function state_player_frostburnbump()
{
	hsp = -xscale * movespeed;
	if (grounded)
	{
		state = states.frostburn;
		movespeed = 0;
	}
}
