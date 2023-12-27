function state_player_cookiemountattack()
{
	hsp = movespeed
	if (place_meeting_solid(x + sign(xscale), y, obj_solid) && (!place_meeting_slope(x + sign(xscale * 10), y + 1) && (!place_meeting(x + sign(xscale), y, obj_destructibles) && !place_meeting(x + sign(xscale), y, obj_chocofrog))))
	{
		input_buffer = 5;
		movespeed = -movespeed
		xscale = -xscale;
		audio_stop_sound(sound_bump);
		scr_sound(sound_bump);
		repeat (4)
			instance_create(x, y, obj_slapstar);
	}
	sprite_index = spr_cookiemount_dash
	movespeed = approach(movespeed, (13 * xscale), 2)
	verticalMovespeed = approach(verticalMovespeed, 3, 0.2)
	vsp = verticalMovespeed
	image_speed = 0.35
	if (floor(image_index) == (image_number - 1))
	{
		movespeed = (13 * xscale);
		hsp = movespeed
		image_index = 0
		sprite_index = spr_cookiemount_idle
		image_speed = 0.35
		state = states.cookiemount
	}
	if place_meeting(x, y, obj_hotcaramel)
	{
		verticalMovespeed = -9
		vsp = verticalMovespeed
		sprite_index = spr_cookiemountballonstart
		image_speed = 0.35
		image_index = 0;
		state = states.cookiemountfireass
	}
}
