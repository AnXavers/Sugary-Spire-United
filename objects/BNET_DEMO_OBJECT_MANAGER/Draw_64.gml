var d = draw_get_halign();

draw_set_halign(fa_left);

draw_text(0, 20,
+"\nping: "+string(bnet("ping"))
+"\nid: "+string(bnet("id"))
+"\nname: "+string(bnet("name"))
);

draw_text(5, room_height - 120, "online players: "+string(ds_map_size(global.client_map))+"\nIn room players"+string(ds_map_size(global.room_client_map))+"\nInstances"+string(ds_map_size(global.instance_map)));

var yy = 80;

for(var i = 0; i < ds_list_size(global.messages); i++){
	var mess = global.messages[| i];
	
	draw_text(5, yy, mess[? "id"]+": "+mess[? "message"]);
	
	yy+= 20;
}

draw_set_halign(d);

draw_text(room_width/2, 10, "Press r or g to chat / shift + spacebar to use voip");

if(shutdown_timer > 0) draw_text(room_width/2, room_height - 10, "Server shutting down in "+string(floor(shutdown_timer / 60))+ " sec(s)");