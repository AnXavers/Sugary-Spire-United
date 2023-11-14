function state_player_gumballoon()
{
	move = key_left + key_right;
	if (!(move == 0 && !key_up))
	{
		dir = move;
		dir2 = key_up;
	}
	hsp = approach(hsp, dir * 6, 1.3);
	verticalMovespeed = approach(verticalMovespeed, dir2 * -6, 1.3);
	vsp = verticalMovespeed;
	if (sign(hsp) != 0)
		xscale = sign(hsp);
	if (place_meeting(x, y, obj_hookstop))
	{
		obj_player.image_index = 0;
		obj_player.image_speed = 0.35;
		obj_player.sprite_index = spr_slipnslidestart;
		obj_player.state = states.puddle;
		movespeed = abs(hsp);
		vsp -= 2;
	}
}
