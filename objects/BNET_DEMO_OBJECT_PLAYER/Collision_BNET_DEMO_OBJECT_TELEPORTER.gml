if(is_player && keyboard_check_released(ord("W"))){
	bnet_instance_destroy();
	
	bnet_room_goto(string(room == BNET_DEMO_ROOM_GAME? BNET_DEMO_ROOM_GAME_2: BNET_DEMO_ROOM_GAME));
}