function state_player_bombpep()
{
	if (sprite_index == spr_pizzelle_bombintro || sprite_index == spr_pizzelle_bombend)
		mask_index = spr_crouchmask;
	else
		mask_index = obj_player.spr_mask;
	if (place_meeting(x, y, obj_watertop))
		bombpeptimer = 0;
	if (key_jump)
		input_buffer_jump = 0;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (grounded && vsp > 0)
		jumpstop = 0;
	mach2 = 0;
	landAnim = 0;
	scr_getinput();
	alarm[5] = 2;
	if (sprite_index == spr_pizzelle_bombintro && floor(image_index) == (image_number - 1))
		sprite_index = spr_pizzelle_bombrun;
	if (sprite_index == spr_pizzelle_bombrun || sprite_index == spr_pizzelle_bombrunabouttoexplode)
	{
		if (movespeed <= 8)
			movespeed += 0.2;
		hsp = floor(xscale * movespeed);
	}
	else
	{
		hsp = 0;
		movespeed = 0;
	}
	if (bombpeptimer < 20 && bombpeptimer != 0)
		sprite_index = spr_pizzelle_bombrunabouttoexplode;
	if (sprite_index == spr_pizzelle_bombend && floor(image_index) == (image_number - 1))
	{
		alarm[5] = 2;
		alarm[7] = 60;
		hurted = 1;
		state = states.normal;
		sprite_index = spr_pizzelle_idle;
		image_index = 0;
	}
	if (bombpeptimer <= 0 && sprite_index == spr_pizzelle_bombrunabouttoexplode)
	{
		scr_sound(sound_explosion);
		hurted = 1;
		instance_create(x, y, obj_bombexplosion);
		sprite_index = spr_pizzelle_bombend;
	}
	if (bombpeptimer > 0)
		bombpeptimer -= 0.5;
	if (scr_solid(x + 1, y) && xscale == 1 && hsp != 0 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_bombblock) && !place_meeting(x + sign(hsp), y, obj_chocofrog))
	{
		instance_create(x + 10, y + 10, obj_bumpeffect);
		xscale *= -1;
	}
	if (scr_solid(x - 1, y) && xscale == -1 && hsp != 0 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_bombblock) && !place_meeting(x + sign(hsp), y, obj_chocofrog))
	{
		instance_create(x - 10, y + 10, obj_bumpeffect);
		xscale *= -1;
	}
	if (input_buffer_jump < 8 && grounded && hsp != 0)
		vsp = -9;
	if (movespeed < 4)
		image_speed = 0.35;
	else if (movespeed > 4 && movespeed < 8)
		image_speed = 0.45;
	else
		image_speed = 0.6;
	if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
		steppy = 1;
	if (floor(image_index) != 0 && floor(image_index) != 2)
		steppy = 0;
	if (!instance_exists(obj_dashcloud) && grounded && hsp != 0)
		instance_create(x, y, obj_dashcloud);
}
