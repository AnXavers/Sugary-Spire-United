for (var s = 0; s < ds_list_size(sockets); s++)
{
	var so = ds_list_find_value(sockets, s)
	send_player_data(so, CMD_X, obj_player.id, obj_player.x)
	send_player_data(so, CMD_Y, obj_player.id, obj_player.y)
	send_player_data(so, CMD_SPRITE, obj_player.id, obj_player.sprite_index)
}