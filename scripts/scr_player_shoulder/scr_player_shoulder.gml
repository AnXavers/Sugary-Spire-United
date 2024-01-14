function state_player_shoulder()
{
	move = key_left + key_right
	hsp = (movespeed * xscale)
	var _lerpamount = 0.01
	var _speedlimit = 16
	if key_sprint
	{
		_lerpamount *= 1.5
		_speedlimit = 18
	}
	if (movespeed < _speedlimit)
		movespeed = lerp(movespeed, _speedlimit, _lerpamount);
	if !audio_is_playing(shouldersfx)
		shouldersfx = scr_soundloop(global.sfxdash1)
	sprite_index = spr_shoulder;
	image_speed = 0.35;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	if (move != xscale && move != 0)
	{
		state = states.jump;
		image_index = 0;
		sprite_index = spr_suplexdashCancel;
		jumpAnim = true;
		momemtum = 0;
		movespeed = 0
		hsp = 0
		mach2 = 0;
		xscale *= -1;
		audio_stop_sound(shouldersfx)
	}
	else if ((scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		movespeed = -3.5;
		vsp = -8;
		mach2 = 0;
		state = states.bump;
		image_index = 0;
		machslideAnim = 1;
		machhitAnim = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		audio_stop_sound(sound_suplex1)
		scr_sound(sound_bump);
		audio_stop_sound(shouldersfx)
	}
	else if (key_jump && grounded)
	{
		sprite_index = spr_longjump;
		image_index = 0
		instance_create(x, y, obj_jumpdust);
		state = states.mach2;
		jumpstop = 0;
		vsp = -11;
		audio_stop_sound(shouldersfx)
	}
	else if key_up
	{
		audio_stop_sound(shouldersfx)
		do_uppercut();
	}
	else if !key_attack
	{
		state = states.mach2;
		sprite_index = spr_mach2
		if movespeed >= 12
		{
			state = states.mach3
			sprite_index = spr_mach3player
		}
		hsp = (movespeed * xscale)
		audio_stop_sound(shouldersfx)
	}
	else if animation_end()
	{
		if !instance_exists(obj_superdashcloud) && key_sprint
			instance_create(x, y, obj_superdashcloud)
		else if !instance_exists(obj_dashcloud)
			instance_create(x, y, obj_dashcloud)
	}
}
