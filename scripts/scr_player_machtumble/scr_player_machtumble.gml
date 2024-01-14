function state_player_machtumble()
{
	static bufferslap = 0;
	static attack_afterimagetimer = 6;
	hsp = xscale * movespeed;
	if grounded
		movespeed += 0.1;
	else
		movespeed += 0.125;
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		scr_sound(sound_maximumspeedland);
		with (obj_camera)
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		image_speed = 0.35;
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				stun = 1;
				alarm[0] = 200;
				ministun = 0;
				vsp = -5;
				hsp = 0;
			}
		}
		flash = 0;
		combo = 0;
		sprite_index = spr_mach3hitwall;
		state = states.bump;
		hsp = -2.5 * xscale;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
	}
	if (key_attack2)
		bufferslap = 0;
	else if (bufferslap < 10)
		bufferslap++;
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
			if (audio_is_playing(sound_suplex1))
				audio_stop_sound(sound_suplex1);
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
			movespeed = 12;
			crouchslipbuffer = 25;
		}
	}
	if (animation_end())
	{
		if (key_sprint)
		{
			if (mach2 < 100)
			{
				state = states.mach2;
				sprite_index = spr_mach2;
			}
			if (mach2 >= 100)
			{
				state = states.mach3;
				sprite_index = spr_mach3player;
			}
		}
		else if (!key_sprint && bufferslap >= 8)
		{
			image_speed = 0.35;
			state = 1;
			grav = 0.5;
		}
		else if (!key_sprint && bufferslap < 8)
		{
			sprite_index = spr_machtumble;
			image_index = 0;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
		}
	}
	image_speed = 0.35;
	if (attack_afterimagetimer > 0)
		attack_afterimagetimer--;
	if (attack_afterimagetimer <= 0 && vsp <= 0)
	{
		attack_afterimagetimer = 6;
	}
}
