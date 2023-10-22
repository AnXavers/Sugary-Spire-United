function send_player_data(argument0, argument1, argument2, argument3)
{
	#macro CMD_X		0
	#macro CMD_Y		0
	#macro CMD_NAME		0
	#macro CMD_SPRITE	0
	#macro CMD_IMAGE	0
	#macro CMD_ALPHA	0
	#macro CMD_ROTATION	0
	#macro CMD_DESTROY	0
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_PLAYER)
	buffer_write(buffer, buffer_u8, argument1)
	buffer_write(buffer, buffer_u16, argument2)
	switch (argument1)
	{
		case CMD_Y:
		case CMD_X:
		case CMD_ROTATION:
			buffer_write(buffer, buffer_s16, argument3);
			break;
		case CMD_IMAGE:
			buffer_write(buffer, buffer_s8, argument3);
			break;
		case CMD_SPRITE:
			buffer_write(buffer, buffer_u16, argument3);
			break;
		case CMD_DESTROY:
			buffer_write(buffer, buffer_u8, argument3);
			break;
		case CMD_ALPHA:
			buffer_write(buffer, buffer_f16, argument3);
			break;
		case CMD_NAME:
			buffer_write(buffer, buffer_string, argument3);
			break;
	}
	network_send_packet(argument0, buffer, buffer_tell(buffer))
}