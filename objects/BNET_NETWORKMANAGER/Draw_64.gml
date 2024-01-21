/*draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(0, 0,
"Frames: "+string(_bnet_lockstep_frame)
+"\ndelay: "+string(_bnet_lockstep_input_delay)
+"\nwait: "+string(_bnet_lockstep_wait)
+"\nping: "+string(_bnet_ping)
+"\nIP: "+string(_bnet_ip)
+"\nServer udp_port: "+string(_bnet_server_udp_port)
+"\nServer tcp_port: "+string(_bnet_tcp_port)
+"\nMy udp port: "+string(_bnet_udp_port)
+"\nRooms: "+string(_bnet_server_room_list != undefined? ds_list_size(_bnet_server_room_list): 0)
);

draw_set_halign(fa_center);
draw_set_valign(fa_center);