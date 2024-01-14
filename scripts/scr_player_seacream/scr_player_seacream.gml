function state_player_seacream()
{
	move = key_left + key_right;
	hsp = movespeed;
	grav = 0.4;
	image_speed = 0.35;
	if (move != 0)
		sprite_index = spr_seacream_walk;
	else
		sprite_index = spr_seacream_idle;
	if (sign(hsp) != 0)
		xscale = sign(hsp);
	var mvsp = 5;
	var accel = 0.4;
	if (place_meeting(x, y + 1, obj_seacreamgoop_floor))
	{
		mvsp = 12;
		accel = 0.6;
	}
	if (move == -xscale)
		accel += 0.3;
	movespeed = approach(movespeed, move * mvsp, accel);
	if (key_jump && grounded)
	{
		image_index = 0;
		sprite_index = spr_seacream_jump;
		state = states.seacreamjump;
		vsp = -12;
		jumpstop = false;
	}
	if (!grounded && !key_jump)
	{
		state = states.seacreamjump;
		jumpstop = true;
	}
	if (place_meeting_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_metalblock) || abs(movespeed) < 12))
	{
		movespeed = 0;
		hsp = 0;
	}
}
function state_player_seacreamjump()
{
	move = key_left + key_right;
	hsp = movespeed;
	grav = 0.4;
	image_speed = 0.35;
	if (sprite_index != spr_seacream_walljump)
	{
		if (sprite_index != spr_seacream_jump || animation_end())
			sprite_index = spr_seacream_fall;
	}
	if (seacream_stick_buffer > 0)
		seacream_stick_buffer--;
	var mvsp = key_sprint ? 6 : 4;
	var accel = 0.5;
	if ((move == -1 && movespeed > -mvsp) || (move == 1 && movespeed < mvsp))
		movespeed = approach(movespeed, move * mvsp, accel);
	if (grounded)
		state = states.seacream;
	if (place_meeting_solid(x + hsp, y) && !place_meeting(x, y, obj_seacreamgoop) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_metalblock) || abs(movespeed) < 12))
	{
		movespeed = 0;
		hsp = 0;
	}
	if (place_meeting(x, y, obj_seacreamgoop) && (place_meeting(x, y, obj_seacreamgoop) && (place_meeting_collision(x + sign(hsp), y, 1) || place_meeting_collision(x + xscale, y, 1))))
	{
		verticalMovespeed = 0;
		state = states.seacreamstick;
		seacream_stick_buffer = 20;
	}
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
}
function state_player_seacreamstick()
{
	move = key_left + key_right;
	hsp = xscale;
	vsp = 0;
	image_speed = 0.35;
	sprite_index = spr_seacream_stick;
	if (key_jump)
	{
		vsp = -10;
		state = states.seacreamjump;
		sprite_index = spr_seacream_walljump;
		xscale *= -1;
		movespeed = xscale * 10;
		seacream_stick_buffer = 1;
	}
	else if (!place_meeting_collision(x + xscale, y))
	{
		state = states.seacreamjump;
		hsp = 0;
		movespeed = 0;
	}
	if (move != 0 && move != xscale)
	{
		if (seacream_stick_buffer > 0)
			seacream_stick_buffer--;
		else
		{
			state = states.seacream;
			xscale *= -1;
			movespeed = xscale * 4;
			seacream_stick_buffer = 10;
		}
	}
	else
		seacream_stick_buffer = 20;
}
