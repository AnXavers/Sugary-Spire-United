function scr_pizzano_kungfu()
{
	switch (airkung)
	{
		case 1:
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
			{
				vsp /= 20;
				jumpstop = 1;
			}
			move = key_left + key_right;
			hsp = xscale * movespeed;
			if (move != 0)
			{
				if (move == xscale && movespeed < 11)
					movespeed += 0.75;
				if (move != xscale && movespeed > -11)
					movespeed -= 0.75;
			}
			if (sprite_index == spr_pizzano_kungfuair1start && animation_end())
				sprite_index = spr_pizzano_kungfuair1;
			if (sprite_index == spr_pizzano_kungfuair2start && animation_end())
				sprite_index = spr_pizzano_kungfuair2;
			if (sprite_index == spr_pizzano_kungfuair3start && animation_end())
				sprite_index = spr_pizzano_kungfuair3;
			if (grounded)
			{
				if (key_sprint)
					state = states.mach2;
				else
					state = states.normal;
				if (movespeed < 6)
					movespeed = 6;
			}
			break;
		case 2:
			move = xscale;
			hsp = movespeed * move;
			movespeed = 8;
			sprite_index = spr_pizzano_kungfuair3start;
			if (sprite_index == spr_pizzano_kungfuair3start && animation_end())
				sprite_index = spr_pizzano_kungfuair3;
			if (scr_solid(x + hsp, y, true))
			{
				state = states.bump;
				sprite_index = spr_djump;
				vsp = -8;
				movespeed = -4;
			}
			if (grounded)
			{
				if (key_sprint)
					state = states.mach2;
				else
					state = states.normal;
				if (movespeed < 0)
					movespeed *= -1;
			}
			vsp += 0.25;
			break;
		case 0:
			move = key_left + key_right;
			hsp = xscale * movespeed;
			if (move != 0)
			{
				if (move == xscale && movespeed < 12)
					movespeed += 0.5;
				if (move != xscale && movespeed > -12)
					movespeed -= 0.4;
			}
			else if (kungtime <= 15 && movespeed > 0 && !key_sprint)
				movespeed -= 0.15;
			if (animation_end())
			{
				if (key_sprint)
					state = states.mach2;
				else
					state = states.normal;
				if (movespeed < 6)
					movespeed = 6;
			}
			if (key_jump && grounded)
			{
				airkung = 1;
				jumpstop = 0;
				vsp = -12;
				sprite_index = choose(spr_pizzano_kungfuair1start, spr_pizzano_kungfuair2start, spr_pizzano_kungfuair3start);
				image_index = 0;
			}
			break;
	}
	image_speed = 0.35;
	if (key_attack2)
	{
		scr_sound(sound_suplex1);
		instance_create(x, y, obj_slaphitbox);
		suplexmove = 1;
		vsp = 0;
		instance_create(x, y, obj_jumpdust);
		image_index = 0;
		sprite_index = spr_pizzano_lunge;
		state = states.pizzano_pummel;
	}
	if (key_down && grounded)
	{
		grav = 0.5;
		sprite_index = spr_crouchslip;
		machhitAnim = 0;
		state = states.crouchslide;
		if (audio_is_playing(sound_suplex1))
			audio_stop_sound(sound_suplex1);
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		if ((!grounded || slopeCheck(x + xscale, y)) && key_sprint)
		{
			verticalMovespeed = movespeed;
			if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
				verticalMovespeed -= round(vsp * 1.25);
			else if (vsp > 0 && character == "N")
				verticalMovespeed -= vsp;
			grabclimbbuffer = 0;
			state = 11;
		}
		else
		{
			state = states.bump;
			hsp = -2.5 * xscale;
			vsp = -3;
			mach2 = 0;
			image_index = 0;
			instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
		}
	}
}
