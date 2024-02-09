function state_player_slap()
{
	if (!grounded)
	{
		fallinganimation++;
		if (fallinganimation >= 40 && fallinganimation < 80)
		{
			sprite_index = spr_facestomp;
			state = states.jump;
		}
	}
	move = key_left + key_right;
	if (momemtum == 0)
	{
		if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
			hsp = move * movespeed;
		else if (place_meeting(x, y + 1, obj_railh))
			hsp = (move * movespeed) - 5;
		else if (place_meeting(x, y + 1, obj_railh2))
			hsp = (move * movespeed) + 5;
	}
	else
		hsp = xscale * movespeed;
	if (move != xscale && momemtum == 1 && movespeed != 0)
		movespeed -= 0.05;
	if (movespeed == 0)
		momemtum = 0;
	if ((move == 0 && momemtum == 0) || scr_solid(x + hsp, y))
		movespeed = 0;
	if (move != 0 && movespeed < 4)
		movespeed += 0.25;
	if (movespeed > 4)
		movespeed -= 0.05;
	if ((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1))
		movespeed = 0;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	if (move == -xscale)
	{
		movespeed = 0;
		momemtum = 0;
	}
	landAnim = 0;
	if (key_attack)
		slapbuffer = 0;
	if (floor(image_index) == (image_number - 1) && slapbuffer < 8)
	{
		if (grounded && move == 0)
		{
			if (slaphand == 1)
			{
				scr_sound(sfx_combovoice6p);
				sprite_index = spr_player_slap1;
			}
			if (slaphand == -1)
			{
				scr_sound(sound_bump);
				sprite_index = spr_player_slap2;
			}
		}
		else if (grounded && move != 0)
		{
			if (slaphand == 1)
			{
				scr_sound(sfx_combovoice6p);
				sprite_index = spr_player_slaprun1;
			}
			if (slaphand == -1)
			{
				scr_sound(sound_bump);
				sprite_index = spr_player_slaprun2;
			}
		}
		else
		{
			if (slaphand == 1)
			{
				scr_sound(sfx_combovoice6p);
				sprite_index = spr_player_slap1air;
			}
			if (slaphand == -1)
			{
				scr_sound(sound_bump);
				sprite_index = spr_player_slap2air;
			}
		}
		image_index = 0;
		slaphand *= -1;
	}
	if (grounded && move == 0)
	{
		if (slaphand == 1)
			sprite_index = spr_player_slap1;
		if (slaphand == -1)
			sprite_index = spr_player_slap2;
	}
	else if (grounded && move != 0)
	{
		if (slaphand == 1)
			sprite_index = spr_player_slaprun1;
		if (slaphand == -1)
			sprite_index = spr_player_slaprun2;
	}
	else
	{
		if (slaphand == 1)
			sprite_index = spr_player_slap1air;
		if (slaphand == -1)
			sprite_index = spr_player_slap2air;
	}
	if (floor(image_index) == 1 && !instance_exists(obj_slaphitbox2))
		instance_create(x, y, obj_slaphitbox2);
	if (floor(image_index) == (image_number - 1) && slapbuffer == 8)
	{
		if (grounded)
			state = states.normal;
		else if (!grounded)
		{
			sprite_index = spr_pizzelle_fall;
			state = states.jump;
		}
	}
	if (move != 0)
		xscale = move;
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	image_speed = 0.35;
}
