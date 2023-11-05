function state_player_knightpepslopes()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = 1;
	hsp = xscale * movespeed;
	if (sprite_index == spr_peppino_knightdownslope)
		movespeed += 0.5;
	if (!scr_slope())
		sprite_index = spr_peppino_knightcharge;
	if (!scr_solid(x + sign(hsp), y) && !scr_solid(x + sign(hsp), y + 1) && scr_solid(x + sign(hsp), y + 2))
		sprite_index = spr_peppino_knightdownslope;
	if (sprite_index == spr_peppino_knightcharge)
		movespeed -= 0.1;
	if (scr_solid(x + sign(hsp), y))
	{
		instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
		vsp = -5;
		hsp = -xscale * 5;
		sprite_index = spr_peppino_knightfall;
		state = 19;
	}
	if (movespeed <= 0 && sprite_index == spr_peppino_knightcharge)
	{
		sprite_index = spr_peppino_knightidle;
		state = 19;
	}
	image_speed = 0.4;
}
