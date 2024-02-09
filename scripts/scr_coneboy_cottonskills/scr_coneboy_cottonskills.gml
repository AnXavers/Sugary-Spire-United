function state_coneboy_cottonbash()
{
	if shoulderbuffer > 0
	shoulderbuffer--
	move = key_left + key_right
	hsp = (movespeed * xscale)
	mach2 = 0;
	if (movespeed < 10)
		movespeed = approach(movespeed, 10, 0.1)
	 if (key_jump2 && grounded)
	{
		sprite_index = spr_coneboy_cottonbounce
		image_index = 0
		instance_create(x, y, obj_jumpdust);
		state = states.cottonbounce
		jumpstop = 0;
		cottonsize = 0
		vsp = -11;
	}
	if (move = -xscale)
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
		scr_sound(sound_bump);
	} 
	if shoulderbuffer = 0
   {
	   state = states.normal
	   image_index = 0
	   landAnim = true
   }
}	
function state_coneboy_cottonbounce()
{
	move = key_left + key_right
	hsp = (movespeed * xscale)
	mach2 = 0;
	if move == xscale && movespeed < 20
		movespeed += 0.1
	if key_jump2
	{
	 if grounded && vsp > 0
	 {
		 if key_down
		vsp = -7
		else if key_up
		vsp = -14
		 else
		 vsp = -11
		 instance_create(x, (y + 20) , obj_bangeffect)
		 scr_sound(sound_bump)
	 }
	else if ((scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope)) && !place_meeting(x + xscale, y, obj_destructibles))
		{
			cancelbuffer = 10
		image_index = 0
		vsp = -8;
		xscale *= -1
		mach2 = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		instance_create(x + 10, y + 10, obj_bangeffect);
		scr_sound(sound_bump);
		} 
	else if scr_solid(x, y - 1) 
		{
			cancelbuffer = 10
			vsp = 8
			audio_stop_sound(sound_bump);
			scr_sound(sound_bump);
			instance_create(x, (y - 20) , obj_bangeffect)
		}	
	}
	else
	{
		if cottonsize < 3
		sprite_index = spr_coneboy_cottonbounce
		else if cottonsize > 3 && cottonsize < 7
		sprite_index = spr_coneboy_cottonbounce_size1
		else if cottonsize > 7
		sprite_index = spr_coneboy_cottonbounce_size2
		if key_attack2
		{
		if !key_sprint
		{
		state = states.normal
		sprite_index = spr_pizzelle_idle
		}
		else
		{
		state = states.mach3
		sprite_index = spr_mach3jump
		}
		}
	}
}	