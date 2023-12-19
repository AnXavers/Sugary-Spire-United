function state_player_cookiemountfireass()
{
	if (input_buffer != 0)
		input_buffer = approach(input_buffer, 0, 1);
	hsp = movespeed;
	move = key_left + key_right;
	if (input_buffer == 0)
		movespeed = approach(movespeed, 0, 0.75);
	if (key_shoot2)
	{
		movespeed = abs(hsp);
		if (movespeed < 6)
			movespeed = 6;
		dir = xscale;
		state = states.mach2;
		sprite_index = spr_mach2jump;
		jumpstop = 0;
		vsp = -11;
		ridingmarsh = false;
		instance_create(x, y, obj_jumpdust);
		with (instance_create(x, y, obj_cookiemount))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cookiemountkick;
		}
	}
	if (key_jump2 && grounded)
		vsp = -12
	if (move == 0 && input_buffer == 0 && sprite_index != spr_cookiemount_skid && sprite_index != spr_cookiemount_dash)
	{
		image_speed = 0.35;
		sprite_index = spr_cookiemount_idle;
	}
	if (move != 0 && sprite_index != spr_cookiemount_skid && sprite_index != spr_cookiemount_dash)
		sprite_index = spr_player_cookiemount;
	if (move != 0 && xscale != move  && sprite_index != spr_cookiemount_dash)
	{
		xscale = move;
		image_speed = 0.35;
		image_index = 0;
		sprite_index = spr_cookiemount_skid;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_cookiemount_skid)
		sprite_index = spr_player_cookiemount;
	if sprite_index == spr_cookiemount_dash
	{
		movespeed = 11;
		hsp = xscale * movespeed
		vsp = approach(vsp, 0, 4)
		image_speed = 0.35
		if floor(image_index) == (image_number - 1)
			sprite_index = spr_player_cookiemount;
	}
	if (key_slap2 && (sprite_index != spr_cookiemount_dash))
	{
		movespeed = 16;
		hsp = xscale * movespeed
		image_speed = 0.35
		sprite_index = spr_cookiemount_dash
		if grounded
			vsp = -12
		else
			vsp = -5
	}
	if ((sprite_index == spr_cookiemountfireass) || (sprite_index == spr_cookiemountfireassstart && floor(image_index) == (image_number - 1)))
	{
		image_speed = 0.35
		vsp = 4
		sprite_index = spr_cookiemountfireass
		if (key_jump2)
		{
			sprite_index = spr_cookiemountfireassend
			vsp = 20
			instance_create(x, y, obj_cloudeffect)
		}
	}
	if sprite_index == spr_cookiemountfireassend
	{
		vsp = approach(vsp, 10, 1)
	}
	if place_meeting(x, y, obj_hotcaramel)
	{
		vsp = -10
		if sprite_index != spr_cookiemountfireass
			sprite_index = spr_cookiemountfireassstart
		image_speed = 0.35
	}
}
