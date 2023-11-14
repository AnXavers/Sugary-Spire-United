function state_player_geyser()
{
	image_speed = 0.35;
	move = key_left + key_right;
	hsp = move * 5;
	if (move != 0)
		xscale = move;
	vsp = approach(vsp, -18, 1);
	sprite_index = spr_geyser;
	if (scr_solid(x, y + vsp) && vsp < 0 && !place_meeting(x, y + vsp, obj_destructibles))
		vsp = 5 + round(-vsp / 10);
	if (!place_meeting(x, y, obj_geyservertical))
	{
		jumpstop = true;
		state = states.jump;
		movespeed = abs(hsp);
		vsp = -18;
	}
}
