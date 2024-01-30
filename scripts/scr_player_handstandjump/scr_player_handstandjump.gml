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
		state = states.jump;
		image_index = 0;
		sprite_index = spr_suplexdashCancel;
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
			state = states.machroll;
			if global.moveset == 2
				state = states.crouchslide
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
			movespeed = 12;
			crouchslipbuffer = 25;
		}
	}
	if (key_jump && grounded)
	{
		sprite_index = spr_longjump;
		image_index = 0
		instance_create(x, y, obj_jumpdust);
		state = states.mach2;
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
				state = states.jump;
				hsp = -2.5 * xscale;
				vsp = -4;
				mach2 = 0;
				sprite_index = spr_suplexbump
				image_index = 0;
				jumpstop = 1
				machslideAnim = 1;
				machhitAnim = 0;
				suplexmove = 1
				instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
				scr_sound(sound_bump);
			}
		}
	}
	image_speed = 0.3;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
		instance_create(x, y, obj_slidecloud);
	if (key_sprint && floor(image_index) == (image_number - 1) && sprite_index != spr_bump)
	{
		image_speed = 0.35;
		state = states.mach2;
		sprite_index = spr_mach2;
		grav = 0.5;
	}
	if (key_attack2 && !key_down)
	{
		sprite_index = spr_machtumble;
		image_index = 0;
		image_speed = 0.2;
		state = states.machtumble;
		var _sfx = (character == "T" || character == "PT") ? sfx_playerspin : sound_throw;
		scr_sound(_sfx);
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
}
