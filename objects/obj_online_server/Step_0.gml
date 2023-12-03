for (var i = 0; i < instance_number(obj_online_player); i++)
{
	var pl = instance_find(obj_online_player, i)
	for (var s = 0; s < ds_list_size(sockets); s++)
	{
		var so = ds_list_find_value(sockets, s)
		send_player_data(so, CMD_ROOM, pl.id, room)
		send_player_data(so, CMD_X, pl.id, pl.x)
		send_player_data(so, CMD_Y, pl.id, pl.y)
		send_player_data(so, CMD_X_SCALE, pl.id, pl.image_xscale)
		send_player_data(so, CMD_SPRITE, pl.id, pl.sprite_index)
		send_player_data(so, CMD_NAME, pl.id, pl.playername)
		send_player_data(so, CMD_MESSAGE, pl.id, pl.msg)
		send_player_data(so, CMD_ID, pl.id, string(pl.id))
	}
}