if (!instance_exists(ID) || (obj_player.state == 70 || obj_player.state == 121 || obj_player.state == 104 || obj_player.state == 101))
	exit;
event_inherited();
if (instance_place(x, y, obj_melon).sprite_index != spr_meloncoolparry)
{
	with (instance_place(x, y, obj_melon))
	{
		state = 21;
		substate = 1;
		image_index = 0;
		sprite_index = spr_meloncoolparry;
	}
}
