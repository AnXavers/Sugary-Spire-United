function state_player_ladder()
{
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	turning = 0;
	jumpstop = 0;
	movespeed = 0;
	hsp = 0;
	suplexmove = 0;
	if (character != "N")
	{
		if (key_up)
		{
			sprite_index = spr_laddermove;
			vsp = -6;
			image_speed = 0.35;
		}
		else if (key_down)
		{
			sprite_index = spr_ladderdown;
			vsp = 6;
			image_speed = -0.35;
		}
		else
		{
			sprite_index = spr_Ladder;
			vsp = 0;
		}
	}
	else if (key_up)
	{
		if (sprite_index == spr_pizzano_ladder2)
			image_index = 7;
		else if (sprite_index == spr_Ladder)
			image_index = 0;
		sprite_index = spr_laddermove;
		vsp = -6;
		image_speed = 0.35;
	}
	else if (key_down)
	{
		if (sprite_index == spr_pizzano_ladder2)
			image_index = 6;
		else if (sprite_index == spr_Ladder)
			image_index = 12;
		sprite_index = spr_ladderdown;
		vsp = 6;
		image_speed = 0.35;
	}
	else
	{
		if (sprite_index == spr_laddermove)
		{
			if (image_index > 3 && image_index < 10)
				sprite_index = spr_pizzano_ladder2;
			else if (sprite_index != spr_Ladder)
				sprite_index = spr_Ladder;
		}
		else if (sprite_index == spr_ladderdown)
		{
			if (image_index > 2 && image_index < 8)
				sprite_index = spr_pizzano_ladder2;
			else if (sprite_index != spr_Ladder)
				sprite_index = spr_Ladder;
		}
		vsp = 0;
	}
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	if (!place_meeting(x, y, obj_ladder))
	{
		landAnim = 0;
		jumpAnim = 0;
		state = 1;
		image_index = 0;
		vsp = 0;
	}
	if (key_jump)
	{
		scr_sound(sound_jump);
		sprite_index = spr_pizzelle_jump;
		ladderbuffer = 20;
		jumpAnim = 1;
		state = states.jump;
		vsp = -9;
		image_index = 0;
	}
	if (key_down && scr_solid(x, y + 1))
	{
		state = 1;
		image_index = 0;
	}
}
