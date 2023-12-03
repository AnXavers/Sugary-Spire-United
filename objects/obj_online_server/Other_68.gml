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
			send_player_data(sock, CMD_ID, pl.id, string(pl.id))
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
	switch (cmd)
	{
		case PACKET_PLAYER:
			var c = buffer_read(buff, buffer_u8)
			var p_id = buffer_read(buff, buffer_s32)
			if !ds_map_exists(clients, p_id)
			{
				var p = instance_create(0, 0, obj_online_player)
				ds_map_set(clients, p_id, p)
				show_debug_message("Created Client")
			}
			var p = clients[? p_id]
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
				case CMD_ID:
					p.playerid = buffer_read(buff, buffer_string)
					break
			}
			break;
	}
}