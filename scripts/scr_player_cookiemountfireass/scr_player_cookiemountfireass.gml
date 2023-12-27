function state_player_cookiemountfireass()
{
	if (input_buffer != 0)
		input_buffer = approach(input_buffer, 0, 1);
	hsp = movespeed;
	move = key_left + key_right;
	if (move != 0 && input_buffer == 0)
	{
		if (move == xscale)
			movespeed = approach(movespeed, xscale * 7, 0.65);
		else
			movespeed = approach(movespeed, 0, 0.45);
	}
	else if (input_buffer == 0)
		movespeed = approach(movespeed, 0, 0.75);
	verticalMovespeed = approach(vsp, 1, 0.2)
	vsp = verticalMovespeed
	if (move != 0 && xscale != move  && sprite_index != spr_cookiemount_dash)
		xscale = move;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_cookiemountballonstart)
		sprite_index = spr_cookiemountballon;
	if key_jump2
	{
		state = states.cookiemount
		sprite_index = spr_cookiemountfireass
		image_index = 0
		vsp = -20
		instance_create(x, y, obj_cloudeffect)
		audio_stop_sound(sfx_balloonblowup)
		scr_sound(sfx_balloonpop)
	}
}
