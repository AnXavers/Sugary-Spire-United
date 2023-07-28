function state_player_chainsawbump()
{
	image_speed = 0.35;
	sprite_index = spr_disguise;
	draw_text(x, y + 150, disguisetimer);
	move = key_right + key_left;
	var speedcap = 14;
	var hspaccel = 0.5;
	var vspaccel = 0.5;
	if (move != 0)
		hspaccel = 0.25;
	else
		hspaccel = 0.5;
	if (move2 != 0)
		vspaccel = 0.25;
	else
		vspaccel = 0.5;
	hsp = approach(hsp, move * speedcap, hspaccel);
	if (hsp != 0)
		xscale = sign(hsp);
	if (key_jump && grounded)
	{
		vsp = -12;
		disguisetimer -= 20;
	}
	if (hsp >= 10)
		disguisetimer -= 0.5;
	if (disguisetimer <= 0)
		state = 1;
}
