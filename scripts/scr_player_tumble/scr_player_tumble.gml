function state_player_tumble()
{
	mask_index = spr_crouchmask;
	hsp = xscale * movespeed;
	if (sprite_index == spr_tumblestart)
	{
		movespeed = approach(movespeed, 6 * xscale, 0.25);
		hsp = movespeed;
	}
	else
		movespeed = 12;
	if (sprite_index == spr_tumblestart && animation_end())
		sprite_index = spr_tumble;
	if (place_meeting_collision(x + xscale, y, 1) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog_tumble))
	{
		scr_sound(sound_tumbleend);
		scr_sound(sound_bump);
		sprite_index = spr_tumbleend;
		state = states.bump;
		landAnim = 0;
		sprite_index = spr_tumbleend;
		image_index = 0;
		hsp = -xscale * 2;
		vsp = -3;
		jumpstop = 1;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = 1;
	}
	if (grounded && vsp > 0)
		jumpstop = 0;
	if (input_buffer_jump < 8 && grounded && hsp != 0)
		vsp = -11;
	image_speed = 0.35;
	with (create_afterimage(0, xscale))
	{
		gonealpha = 0.85;
		alarm[0] = 1;
		alarm[1] = 60;
	}
}
