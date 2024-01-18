var online = bnet("connected");

randomize();
switch(type){
	case "host":
		if(online < 0) bnet_server_create(socket_t, tcpPort, udpPort, 100, string(get_timer()), "Host");
	break;
	case "connect":
		if(online < 0) bnet_server_connect(ip, tcpPort, udpPort, string(get_timer()), "testers '"+string(get_timer())+"'");
	break;
	case "Exit":
		switch(room){
			//If in game room, lets leave it returning to menu.
			case BNET_DEMO_ROOM_GAME: case BNET_DEMO_ROOM_GAME_2: 
				bnet_instance_destroy(bnet("id"));
				
				bnet_room_goto("-1"); 
			break;
			//If in sub-menu, or room that creates or join lobby, and presses exit button, disconnect from server.
			case BNET_DEMO_ROOM_SUB_MENU:
				if(bnet("type") == "client") bnet_disconnect();
				else bnet_server_destroy(180);
			break;
		}
	break;
	case "Create":
		bnet_room_goto(string(BNET_DEMO_ROOM_GAME));
	break;
}