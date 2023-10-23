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
		send_player_data(sock, CMD_ROOM, obj_player.id, room)
		send_player_data(sock, CMD_X, obj_player.id, obj_player.x)
		send_player_data(sock, CMD_Y, obj_player.id, obj_player.y)
		send_player_data(sock, CMD_X_SCALE, obj_player.id, obj_player.image_xscale)
		send_player_data(sock, CMD_SPRITE, obj_player.id, obj_player.sprite_index)
		send_player_data(sock, CMD_NAME, obj_player.id, obj_player.playername)
		send_player_data(sock, CMD_MESSAGE, obj_player.id, obj_player.msg)
		send_player_data(sock, CMD_TYPING, obj_player.id, obj_player.typing)
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
	switch (cmd)
	{
		case PACKET_PLAYER:
			var c = buffer_read(buff, buffer_u8)
			var e_id = buffer_read(buff, buffer_s32)
			if !ds_map_exists(clients, e_id)
			{
				var p = instance_create(0, 0, obj_online_player)
				ds_map_set(clients, e_id, p)
				show_debug_message("Created Client")
			}
			var p = clients[? e_id]
			switch(c)
			{
				case CMD_ROOM:
					p.roomid = buffer_read(buff, buffer_u16)
					break
				case CMD_X:
					p.x = buffer_read(buff, buffer_s16)
					break
				case CMD_Y:
					p.y = buffer_read(buff, buffer_s16)
					break
				case CMD_X_SCALE:
					p.image_xscale = buffer_read(buff, buffer_s8)
					break
				case CMD_SPRITE:
					p.sprite_index = buffer_read(buff, buffer_u32)
					break
				case CMD_NAME:
					p.playername = buffer_read(buff, buffer_string)
					break
				case CMD_MESSAGE:
					p.msg = buffer_read(buff, buffer_string)
					break
				case CMD_TYPING:
					p.typing = buffer_read(buff, buffer_bool)
					break
			}
			break;
	}
}