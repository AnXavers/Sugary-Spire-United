function state_player_charge()
{
	if (windingAnim < 2000)
		windingAnim++;
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	if (!key_sprint)
		movespeed -= 0.5;
	else if (movespeed < 10)
		movespeed++;
	else if (movespeed > 10)
		movespeed -= 0.15;
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	crouchslideAnim = 1;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (movespeed <= 0)
		state = states.grab;
	if (key_attack2)
	{
		sprite_index = spr_swingdingend;
		state = states.finishingblow;
		image_index = 0;
		movespeed /= 2;
	}
	if (grounded && vsp > 0)
		jumpstop = 0;
	if (input_buffer_jump < 8 && grounded)
	{
		scr_sound(sound_jump);
		vsp = -10;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (scr_solid(x + xscale, y, true))
		xscale *= -1;
	image_speed = 0.65;
	if (!instance_exists(obj_dashcloud) && grounded)
		instance_create(x, y, obj_dashcloud);
}
