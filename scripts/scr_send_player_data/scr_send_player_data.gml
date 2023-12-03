function send_player_data(argument0, argument1, argument2, argument3)
{
	#macro CMD_ROOM		0
	#macro CMD_X		1
	#macro CMD_Y		2
	#macro CMD_X_SCALE	3
	#macro CMD_SPRITE	4
	#macro CMD_NAME		5
	#macro CMD_MESSAGE	6
	#macro CMD_ID		7
	buffer_seek(buffer, buffer_seek_start, 0)
	buffer_write(buffer, buffer_u8, PACKET_PLAYER)
	buffer_write(buffer, buffer_u8, argument1)
	buffer_write(buffer, buffer_s32, argument2)
	switch (argument1)
	{
		case CMD_ROOM:
			buffer_write(buffer, buffer_u16, argument3);
			break;
		case CMD_X:
			buffer_write(buffer, buffer_s16, argument3);
			break;
		case CMD_Y:
			buffer_write(buffer, buffer_s16, argument3);
			break;
		case CMD_X_SCALE:
			buffer_write(buffer, buffer_s8, argument3);
			break;
		case CMD_SPRITE:
			buffer_write(buffer, buffer_u32, argument3);
			break;
		case CMD_NAME:
			buffer_write(buffer, buffer_string, argument3);
			break;
		case CMD_MESSAGE:
			buffer_write(buffer, buffer_string, argument3);
			break;
		case CMD_ID:
			buffer_write(buffer, buffer_string, argument3);
			break;
	}
	network_send_packet(argument0, buffer, buffer_tell(buffer))
}