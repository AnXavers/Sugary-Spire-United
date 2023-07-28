function state_player_fireass()
{
	static fire_afterimagetimer = 6;
	image_speed = 0.35;
	if (scr_solid(x + xscale, y, false) && !place_meeting(x + xscale, y, obj_chocofrog))
		xscale *= -1;
	if (sprite_index == spr_player_fireass)
	{
		move = key_left + key_right;
		if (move != 0)
			xscale = move;
		hsp = move * movespeed;
		movespeed = 5;
		if (grounded && vsp > 0)
		{
			movespeed = 6;
			sprite_index = spr_player_fireassend;
			image_index = 0;
		}
	}
	if (sprite_index == spr_player_fireassend)
	{
		hsp = xscale * movespeed;
		if (movespeed > 0)
			movespeed -= 0.25;
		if (floor(image_index) == (image_number - 1))
		{
			state = 1;
			hsp = 0;
			image_index = 0;
			alarm[5] = 2;
			alarm[7] = 60;
			hurted = 1;
			landAnim = 0;
		}
	}
	if (fire_afterimagetimer > 0)
		fire_afterimagetimer--;
	if (fire_afterimagetimer <= 0 && sprite_index != spr_player_fireassend)
	{
		create_afterimage(3, xscale);
		fire_afterimagetimer = 6;
	}
}
