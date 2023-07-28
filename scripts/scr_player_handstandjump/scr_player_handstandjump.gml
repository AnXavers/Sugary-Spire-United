function state_player_handstandjump()
{
	static _speednerf = 2;
	move = key_left + key_right;
	landAnim = 0;
	if (mach2 < 35)
		mach2 = 35;
	if (floor(image_index) < 5)
	{
		vsp = min(vsp, 0);
		_speednerf = approach(_speednerf, 0, 0.5);
	}
	else
		_speednerf = 1;
	if (movespeed < 10)
		movespeed = approach(movespeed, 10, 0.5);
	hsp = xscale * movespeed;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (grounded && vsp > 0)
		jumpstop = 0;
	momemtum = 1;
	dir = xscale;
	if (move != xscale && move != 0)
	{
		state = 60;
		image_index = 0;
		sprite_index = spr_player_suplexdashCancel;
		jumpAnim = true;
		momemtum = 0;
		mach2 = 0;
		xscale *= -1;
	}
	if (floor(image_index) == (image_number - 1))
	{
		state = 1;
		grav = 0.5;
		flash = 0;
	}
	if (key_down)
	{
		if (grounded)
		{
			grav = 0.5;
			sprite_index = spr_crouchslip;
			machhitAnim = 0;
			state = 31;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
			movespeed = 12;
			crouchslipbuffer = 25;
		}
	}
	if (key_jump && grounded)
	{
		sprite_index = spr_mach2jump;
		instance_create(x, y, obj_jumpdust);
		state = 69;
		jumpstop = 0;
		vsp = -11;
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		var _ledge = 0;
		_ledge -= slope_check_up(x + xscale, y, 32);
		_ledge += slope_check_down(x + xscale, y, 3);
		if (_ledge != 0)
			y += _ledge;
		else if (_ledge <= 0 && !place_meeting(x + xscale, y, obj_destructibles))
		{
			if (!grounded || slopeCheck(x + xscale, y))
			{
				verticalMovespeed = 7;
				if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
					verticalMovespeed -= vsp;
				grabclimbbuffer = 10;
				state = 11;
			}
			else
			{
				grav = 0.5;
				movespeed = 0;
				state = 72;
				hsp = -2.5 * xscale;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				machslideAnim = 1;
				machhitAnim = 0;
				instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
				scr_sound(sound_bump);
			}
		}
	}
	image_speed = 0.3;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
		instance_create(x, y, obj_slidecloud);
	if (key_attack && floor(image_index) == (image_number - 1) && sprite_index != spr_player_bump)
	{
		image_speed = 0.35;
		state = 69;
		sprite_index = spr_mach2;
		grav = 0.5;
	}
	if (key_slap2 && !key_down && animation_end(undefined, 5))
	{
		sprite_index = spr_player_machtumble;
		image_index = 0;
		image_speed = 0.2;
		state = 103;
		if (movespeed < 13)
			movespeed += 2;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
}
