if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == states.pizzano_shoulderbash || obj_player.state == states.pizzano_rocketfist || obj_player.state == states.minecart || obj_player.state == states.pepperman_pinball))
	exit;
event_inherited();
if (instance_place(x, y, obj_melon).sprite_index != spr_meloncoolparry)
{
	with (instance_place(x, y, obj_melon))
	{
		state = 21;
		substate = substates.unknown_1;
		image_index = 0;
		sprite_index = spr_meloncoolparry;
	}
}
