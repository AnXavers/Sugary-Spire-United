/// @description STRESS TEST LOOP
randomize();
alarm[7] = 1;
if(bnet("connected")) {
	if(room == BNET_DEMO_ROOM_GAME){
		bnet_instance_destroy(bnet("id"))
		
		bnet_room_goto(string(BNET_DEMO_ROOM_GAME_2));
		
		bnet_room_update(bnet("room"));
	}else if(room == BNET_DEMO_ROOM_GAME_2){
		bnet_instance_destroy(bnet("id"))
		
		bnet_room_goto(string(BNET_DEMO_ROOM_GAME));
		
		bnet_room_update(bnet("room"));
	}
	
	bnet_server_version_check();
	
	bnet_event_execute_broadcast_tcp(bnet("server"), "bnet_test", "heyyy");
	bnet_event_execute_broadcast_udp(bnet("server"), "bnet_test", "heyyy");
	bnet_event_execute_tcp(bnet("id"), "bnet_test", "");
	bnet_event_execute_udp(bnet("id"), "bnet_test", "");
	
	bnet_chat_send_message("general");
	bnet_chat_send_message("room list", bnet("room"));
	var map = ds_map_create();
	map[? "coin"] = irandom(10000);
	
	bnet_namespace_create("testers");
	bnet_namespace_add("testers", bnet("id"));
	bnet_namespace_delete("testers", bnet("id"))
	bnet_namespace_destroy("testers")
	
	
	bnet_file_create("savedata", json_encode(map));
	bnet_file_read("savedata");
	bnet_file_update("savedata", json_encode(map));
	bnet_file_read("savedata");

	
	bnet_file_delete("savedata");
	/*var n = "test";
	bnet_mongodb_database_create(n);
	bnet_mongodb_database_get(n);
	bnet_mongodb_database_get("");
	bnet_mongodb_collection_create(n, n);
	bnet_mongodb_collection_get(n, n);
	bnet_mongodb_collection_get(n, "");
	bnet_mongodb_document_create(n, n, n);
	bnet_mongodb_document_set(n, n, n, n, n);
	bnet_mongodb_document_get(n, n, n);
	bnet_mongodb_document_get(n, n, "");
	bnet_mongodb_document_push(n, n, n, "a", string([0, "lol"]));
	bnet_mongodb_document_pull(n, n, n, "a", string([0, "lol"]));
	bnet_mongodb_document_unset(n, n, n, n);
	bnet_mongodb_document_destroy(n, n, n)*/
	
	var buffer = buffer_create(1, buffer_grow, 1);
	buffer_seek(buffer, buffer_seek_start, 0);

	buffer_write(buffer, buffer_string, "hello world");
	buffer_write(buffer, buffer_string, "yeah dread");

	bnet_network_send_broadcast_tcp(bnet("server"), buffer, buffer_tell(buffer))
	bnet_network_send_broadcast_udp(bnet("room"), buffer, buffer_tell(buffer))
	
	buffer_delete(buffer);
	
	bnet_email_send("smtp.gmail.com", "465", "bnetnetworkdemo@gmail.com","bnetdemo12345", "test@gmail.com", "testMessage", "<h1>Hey this a test message.</h1>", "");
}else exit;

alarm[7] = 1;