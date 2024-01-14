function state_player_punch()
{
	if character != "PT"
	{
	movespeed = 0;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	if (floor(image_index) == (image_number - 1))
		state = states.normal;
	sprite_index = spr_punch;
	image_speed = 0.35;
	}
	else
	 hsp = (xscale * movespeed)
		move = (key_left + key_right)
		momemtum = 1
		dir = xscale
		if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
		{
			vsp /= 10
			jumpstop = 1
		}
		if (move != xscale && move != 0)
			state = states.normal
		if (floor(image_index) == (image_number - 1))
			state = states.normal
	
		if (pogochargeactive == 1)
		{
			if key_sprint2
			{
				state = states.pizzano_rocketfist
				image_index = 0
				sprite_index = spr_noise_jetpackstart
				hsp = 0
				vsp = 0
			}
		}
		if (key_down && grounded && vsp > 0)
		{
			grav = 0.5
			sprite_index = spr_crouchslip
			machhitAnim = 0
			state = states.machroll
			movespeed = 12
		}
		if key_jump
			input_buffer_jump = 0
		if (grounded && input_buffer_jump < 8)
		{
		   scr_sound(sound_jump)
			instance_create(x, y, obj_highjumpcloud2)
			vsp = -9
		}
		if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		{
			 scr_sound(sound_bump)
			grav = 0.5
			movespeed = 0
			state = states.bump
			hsp = -2.5
			vsp = -3
			mach2 = 0
			image_index = 0
			machslideAnim = 1
			machhitAnim = 0
			instance_create((x + 10), (y + 10), obj_bumpeffect)
		}
		if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		{
			scr_sound(sound_bump)
			grav = 0.5
			movespeed = 0
			state = states.bump
			hsp = 2.5
			vsp = -3
			mach2 = 0
			image_index = 0
			machslideAnim = 1
			machhitAnim = 0
			instance_create((x - 10), (y + 10), obj_bumpeffect)
		}
		if (key_sprint2 && character == "PT" && pogochargeactive == 0)
		{
			sprite_index = spr_noise_pogostart
			image_index = 0
			state = states.pogo
			pogospeed = 10
			vsp = -11
		}
		if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
		{
			with (instance_create(x, y, obj_slidecloud))
				image_xscale = other.xscale
		}
		image_speed = 0.35
}
