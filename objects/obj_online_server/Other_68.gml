var event_id = async_load[? "id"]
if server == event_id
{
	var type = async_load[? "type"]
	var sock = async_load[? "socket"]
	if (type == network_type_connect)
	{
		ds_list_add(sockets, sock)
		var p = instance_create(CMD_X, CMD_Y, obj_online_player)
		ds_map_add(clients, sock, p)
		for (var i = 0; i < instance_number(obj_online_player); i++)
		{
			var pl = instance_find(obj_online_player, i)
			send_player_data(sock, CMD_ROOM, pl.id, room)
			send_player_data(sock, CMD_X, pl.id, pl.x)
			send_player_data(sock, CMD_Y, pl.id, pl.y)
			send_player_data(sock, CMD_X_SCALE, pl.id, pl.image_xscale)
			send_player_data(sock, CMD_SPRITE, pl.id, pl.sprite_index)
			send_player_data(sock, CMD_NAME, pl.id, pl.playername)
			send_player_data(sock, CMD_MESSAGE, pl.id, pl.msg)
			send_player_data(sock, CMD_TYPING, pl.id, pl.typing)
		}
	}
	if (type == network_type_disconnect)
	{
		var p = clients[? sock]
		if (instance_exists(p))
		{
			with (p)
				instance_destroy()
		}
		ds_list_delete(sockets, ds_list_find_index(sockets, sock))
		ds_map_delete(clients, sock)
	}
}
else if event_id != global.socket
{
	var sock = async_load[? "id"]
	var buff = async_load[? "buffer"]
	buffer_seek(buff, buffer_seek_start, 0)
	var cmd = buffer_read(buff, buffer_u8)
	var p = clients[? sock]
}