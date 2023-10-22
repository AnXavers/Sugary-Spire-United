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
			var e_id = buffer_read(buff, buffer_u16)
			if !ds_map_exists(players, e_id)
			{
				var p = instance_create(0, 0, obj_
			}
			break;
	}
}