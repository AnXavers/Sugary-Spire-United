for (var i = 0; i < instance_number(obj_player); i++)
{
	var pl = instance_find(obj_player, i)
	for (var s = 0; s < ds_list_size(sockets); s++)
	{
		var so = ds_list_find_value(sockets, s)
		send_player_data(so, CMD_X, pl.id, pl.x)
		send_player_data(so, CMD_Y, pl.id, pl.y)
		send_player_data(so, CMD_SPRITE, pl.id, pl.sprite_index)
	}
}