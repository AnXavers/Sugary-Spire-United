var type = ds_map_find_value(async_load, "type")
online_timeout = 0
if (type == 3)
{
    var buffer = ds_map_find_value(async_load, "buffer")
    var data_buffer = buffer
    var size = ds_map_find_value(async_load, "size")
    var data_size = size
    if leaked_packet
    {
        if leaked_size
        {
            leaked_size = 0
            buffer_copy(buffer, buffer_tell(buffer), missing_bytes, storage_buffer, leaked_packet)
            buffer_seek(storage_buffer, buffer_seek_start, 0)
            buffer_seek(buffer, buffer_seek_relative, missing_bytes)
            leaked_packet += missing_bytes
            missing_bytes = buffer_read(storage_buffer, buffer_u32)
        }
        if (size < missing_bytes)
        {
            var tell = buffer_tell(buffer)
            buffer_copy(buffer, tell, (size - tell), storage_buffer, leaked_packet)
            buffer_seek(buffer, buffer_seek_end, 0)
            missing_bytes -= size
            leaked_packet += size
            size = 0
        }
        else
        {
            var combined_size = (leaked_packet + missing_bytes)
            var combined_buffer = buffer_create(combined_size, buffer_grow, 1)
            buffer_copy(storage_buffer, 0, leaked_packet, combined_buffer, 0)
            buffer_copy(buffer, buffer_tell(buffer), missing_bytes, combined_buffer, leaked_packet)
            buffer_seek(buffer, buffer_seek_relative, missing_bytes)
            buffer_seek(combined_buffer, buffer_seek_start, 0)
            buffer_seek(storage_buffer, buffer_seek_start, 0)
            buffer = combined_buffer
            size = combined_size
            missing_bytes = 0
            leaked_packet = 0
            use_leak = 1
        }
    }
    while (buffer_tell(buffer) < size)
    {
        if ((size - buffer_tell(buffer)) < 4)
        {
            leaked_packet = (size - buffer_tell(buffer))
            missing_bytes = (4 - leaked_packet)
            buffer_copy(buffer, buffer_tell(buffer), leaked_packet, storage_buffer, 0)
            buffer_seek(storage_buffer, buffer_seek_start, 0)
            buffer_seek(buffer, buffer_seek_end, 0)
            leaked_size = 1
            break
        }
        else
        {
            var pack_size = buffer_read(buffer, buffer_u32)
            if (pack_size > 65000)
                socket_send_error(("Big packet size: " + string(pack_size)))
            if ((buffer_tell(buffer) + pack_size) > size)
            {
                buffer_seek(buffer, buffer_seek_relative, -4)
                var size_delta = (size - buffer_tell(buffer))
                buffer_copy(buffer, buffer_tell(buffer), size_delta, storage_buffer, 0)
                leaked_packet = size_delta
                missing_bytes = ((pack_size - size_delta) + 4)
                buffer_seek(storage_buffer, buffer_seek_start, 0)
                buffer_seek(buffer, buffer_seek_end, 0)
            }
            else
            {
                var offset = buffer_tell(buffer)
                var msg_type = buffer_read(buffer, buffer_u32)
                with (obj_online_packet_manager)
                    packet_received(buffer, msg_type)
                if (buffer_tell(buffer) != (offset + pack_size))
                {
                    with (obj_online_manager)
                        socket_send_error(((((((((("Missed a few packets, type: " + string(msg_type)) + ", offset: ") + string(offset)) + ", packet size: ") + string(pack_size)) + ", buffer size: ") + string(size)) + ", curr offset: ") + string(buffer_tell(buffer))))
                }
                buffer_seek(buffer, buffer_seek_start, (offset + pack_size))
            }
            if use_leak
            {
                buffer = data_buffer
                size = data_size
                buffer_delete(combined_buffer)
                use_leak = 0
            }
            continue
        }
    }
}
else if (type == 2)
    show_message("Disconnected from the server")
else if (type == 4)
    connected = 1
