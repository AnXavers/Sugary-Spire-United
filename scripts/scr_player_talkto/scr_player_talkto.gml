function state_player_talkto()
{
	image_speed = 0.35;
	if (key_taunt2 || (!instance_exists(obj_dialogue) && !instance_exists(obj_dialogue_choices)))
		state = states.normal;
	hsp = 0;
	vsp = 0;
	if (sprite_index != spr_pizzelle_idle)
		sprite_index = spr_pizzelle_idle;
}
