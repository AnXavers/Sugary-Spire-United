function state_pepperman_pinball(){
	if (input_buffer != 0)
		input_buffer = approach(input_buffer, 0, 1);
	hsp = movespeed * xscale;
	move = key_left + key_right;
	if (input_buffer == 0)
	{
		if (place_meeting_solid(x + sign(xscale), y, obj_solid) && (!place_meeting_slope(x + sign(xscale), y + 1) && (!place_meeting(x + sign(xscale), y, obj_destructibles) && !place_meeting(x + sign(xscale), y, obj_chocofrog))))
		{
			input_buffer = 5;
			xscale = -(xscale);
			vsp = -14
			audio_stop_sound(sound_bump);
			scr_sound(sound_bump);
			repeat (4)
				instance_create(x, y, obj_slapstar);
		}
		if grounded
		{
			input_buffer = 5;
			vsp = -14
			audio_stop_sound(sound_bump);
			scr_sound(sound_bump);
			repeat (4)
				instance_create(x, y, obj_slapstar);
		}
		if place_meeting_solid(x, y - 1, obj_solid)
		{
			input_buffer = 5;
			vsp = 8
			audio_stop_sound(sound_bump);
			scr_sound(sound_bump);
			repeat (4)
				instance_create(x, y, obj_slapstar);
		}	
	}
	if ((key_attack2 || key_shoot2 || key_jump2) && (sprite_index == spr_pepperman_rolling))
	{
		state = states.mach3
		sprite_index = spr_mach3jump
		exit;
	}
	else if !(key_sprint)
	{
		state = states.normal
		sprite_index = spr_pizzelle_idle
		exit;
	}
	if (key_down2)
	{
		image_index = 0;
		sprite_index = spr_pizzelle_groundpoundprep;
		vsp = -6;
		if (global.treat)
		{
			vsp = -10;
			sprite_index = spr_donutSlam_intro;
			instance_create(x, y, obj_donutSlammable);
		}
		state = states.freefallprep;
	}
	sprite_index = spr_pepperman_rolling
	image_speed = 0.35
}