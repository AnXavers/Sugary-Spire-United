for (var s = 0; s < ds_list_size(sockets); s++)
{
	var so = ds_list_find_value(sockets, s)
	send_player_data(so, CMD_ROOM, obj_player.id, room)
	send_player_data(so, CMD_X, obj_player.id, obj_player.x)
	send_player_data(so, CMD_Y, obj_player.id, obj_player.y)
	send_player_data(so, CMD_X_SCALE, obj_player.id, obj_player.image_xscale)
	send_player_data(so, CMD_SPRITE, obj_player.id, obj_player.sprite_index)
	send_player_data(so, CMD_NAME, obj_player.id, obj_player.playername)
	send_player_data(so, CMD_MESSAGE, obj_player.id, obj_player.msg)
	send_player_data(so, CMD_TYPING, obj_player.id, obj_player.typing)
}