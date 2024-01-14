function state_player_Sjump()
{
	if (key_shoot2 && character == "M")
	{
		state = states.pepperman_pinball
		image_index = 0;
		sprite_index = spr_pepperman_rolling
		var move = key_right - key_left
		if move != 0
			movespeed = move * 12
		else
			movespeed = choose(12, -12)
		vsp = -16
		exit;
	}
	hsp = 0;
	Sjumpcan_doublejump = false;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	charactersjump = 0
	if (character == "N" || character == "T" || character == "PT")
		charactersjump = 1
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	if (sprite_index == spr_superjump || sprite_index == spr_outofcontrolfall)
	{
		vsp = -movespeed;
		movespeed = approach(movespeed, 18, 1);
	}
	if (sprite_index == spr_noise_jetpackboostdown)
	{
		vsp = movespeed;
		movespeed = 12
	}
	if ((sprite_index == spr_superjumpprep && charactersjump) || sprite_index == spr_superjump_cancelprep)
		vsp = 0;
	if ((sprite_index == spr_superjumpprep && charactersjump) && floor(image_index) == (image_number - 1))
	{
		scr_sound(sound_superjumprelease);
		vsp = -10;
	}
	 if (sprite_index == spr_superjumpprep || sprite_index == spr_superjump_cancelprep)
		vsp = 0
	if (sprite_index == spr_superjumpprep && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_superjump
		scr_sound(sound_superjumprelease)
		vsp = -10
	}
	if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_boxofpizza) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles) && sprite_index != spr_superjump_cancelprep)
	{
		scr_sound(sound_maximumspeedland);
		if vsp != 12
		sprite_index = spr_superjumpland;
		else
		sprite_index = spr_freefallland;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				image_index = 0;
				state = states.frozen;
				vsp = -7;
				hsp = 0;
			}
		}
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = 0;
		movespeed = 0;
	}
	  if (character == "PT" && key_jump2)
	{
		jumpstop = 0
		vsp = -15
		hsp = (3 * xscale)
		state = states.jump
		sprite_index = spr_noise_noisebombspinjump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
	}
	if (character == "PT" && sprite_index != spr_superjump_cancelprep)
	{
		if (move == 1)
			hsp = 6
		if (move == -1)
			hsp = -6
	}
	if ((key_sprint2 || key_attack2) && !grounded && vsp < -10 && !charactersjump && (sprite_index != spr_superjump_cancelprep))
	{
		scr_sound(sound_superjumpcancel);
		image_index = 0;
		vsp = 0;
		sprite_index = spr_superjump_cancelprep;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjump_cancelprep)
	{
		if (move != 0)
			xscale = move;
		movespeed = 13;
		machhitAnim = 0;
		state = states.mach3;
		flash = 1;
		vsp = -4;
		image_index = 0;
		sprite_index = spr_superjump_cancel;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
	if ((key_sprint2 || key_attack2) && !grounded &&  (vsp < -10 || sprite_index == spr_noise_jetpackboostdown) && charactersjump)
	{
		scr_sound(sound_superjumpcancel);
		flash = 1;
		charged = 0;
		if sprite_index == spr_noise_jetpackboostdown
			image_index = 11
		else
		image_index = 0;
		sprite_index = spr_superjump_cancelprep;
		movespeed = 0;
		vsp = 0;
		mach2 = 0;
		state = states.pizzano_rocketfist;
	}
			if sprite_index == spr_noise_jetpackboostdown && !instance_exists(obj_groundpoundeffect)
			instance_create(x, y, obj_groundpoundeffect, 
			{
				obj_player: id
			});
	image_speed = 0.5;
	scr_collision();
}
