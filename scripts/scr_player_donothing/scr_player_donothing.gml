function state_player_donothing()
{
	cutscene = true;
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	pogomovespeed = 0;
	if (substate == 0)
	{
		sprite_index = spr_pizzelle_idle;
		image_speed = 0.35;
		visible = false;
	}
}
