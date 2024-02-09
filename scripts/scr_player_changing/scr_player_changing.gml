function state_player_changing()
{
	cutscene = true;
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	pogomovespeed = 0;
	sprite_index = spr_pizzelle_idle;
	image_speed = 0.35;
	visible = false;
	x = approach(x, obj_costumerdoor.x, 2);
	y = approach(y, obj_costumerdoor.y, 16);
}
