function state_player_knightpep()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = 1;
	if (sprite_index == spr_peppino_knightwalk || sprite_index == spr_peppino_knightjump || sprite_index == spr_peppino_knightfall || sprite_index == spr_peppino_knightidle)
	{
		move = key_left + key_right;
		hsp = move * movespeed;
	}
	else if (grounded)
	{
		hsp = 0;
		move = 0;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (grounded && vsp > 0)
		jumpstop = 0;
	if ((sprite_index == spr_peppino_knightidle || sprite_index == spr_peppino_knightwalk) && key_attack2)
	{
		scr_sound(mu_martian_greenhouse);
		instance_create(x, y, obj_swordhitbox);
		instance_create(x + (-xscale * 10), y, obj_slidecloud);
		sprite_index = spr_peppino_knightattack;
		image_index = 0;
		state = 20;
	}
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	if (grounded && move != 0 && sprite_index == spr_peppino_knightidle)
		sprite_index = spr_peppino_knightwalk;
	else if (grounded && move == 0 && sprite_index == spr_peppino_knightwalk)
		sprite_index = spr_peppino_knightidle;
	if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_peppino_knightidle || sprite_index == spr_peppino_knightwalk))
	{
		scr_sound(mu_ranks);
		image_index = 0;
		sprite_index = spr_peppino_knightjumpstart;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_peppino_knightjumpstart)
	{
		vsp = -11;
		if (key_right)
			hsp = 4;
		if (-key_left)
			hsp = -4;
		sprite_index = spr_peppino_knightjump;
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_peppino_knightjump) || (!grounded && sprite_index != spr_peppino_knightjump))
		sprite_index = spr_peppino_knightfall;
	if (sprite_index == spr_peppino_knightfall && grounded)
	{
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
		image_index = 0;
		freefallstart = 0;
		momemtum = 0;
		scr_sound(sfx_bloop2);
		instance_create(x, y, obj_landcloud);
		sprite_index = spr_peppino_knightland;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_peppino_knightland)
		sprite_index = spr_peppino_knightidle;
	if (move != 0)
		xscale = move;
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.5;
		else if (movespeed == 6)
			movespeed = 6;
	}
	else
		movespeed = 0;
	if (move != 0)
	{
		if (movespeed < 1)
			image_speed = 0.15;
		else if (movespeed > 1 && movespeed < 4)
			image_speed = 0.35;
		else
			image_speed = 0.6;
	}
	else
		image_speed = 0.35;
	if (floor(image_index) == 4 && sprite_index == spr_peppino_knightstart)
		instance_create(x, y - 600, obj_thunder);
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_peppino_knightthunder)
		sprite_index = spr_peppino_knightidle;
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
	{
		scr_sound(mu_swamp2);
		steppy = 1;
	}
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = 0;
}
