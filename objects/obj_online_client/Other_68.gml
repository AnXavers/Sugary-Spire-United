var event_id = async_load[? "id"]
if socket == event_id
{
	var buff = async_load[? "buffer"]
	buffer_seek(buff, buffer_seek_start, 0)
	var cmd = buffer_read(buff, buffer_u8)
	switch(cmd)
	{
		case PACKET_PLAYER:
			var c = buffer_read(buff, buffer_u8)
			var e_id = buffer_read(buff, buffer_u32)
			if !ds_map_exists(players, e_id)
			{
				var p = instance_create(0, 0, obj_online_player)
				ds_map_set(players, e_id, p)
				show_debug_message("Created Player")
			}
			var p = players[? e_id]
			switch(c)
			{
				case CMD_Y:
					p.y = buffer_read(buff, buffer_s16);
					break;
				case CMD_X:
					p.x = buffer_read(buff, buffer_s16);
					break;
				case CMD_SPRITE:
					p.sprite_index = buffer_read(buff, buffer_u16);
					break;
				case CMD_NAME:
					p.playername = buffer_read(buff, buffer_string);
					break;
				case CMD_DESTROY:
					buffer_read(buff, buffer_u8);
					ds_map_delete(players, e_id)
					with (p)
					{
						instance_destroy()
					}
					break;
			}
			break
	}
}