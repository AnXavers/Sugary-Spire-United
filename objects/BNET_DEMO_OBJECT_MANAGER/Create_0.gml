//Created a macro to use for what socket connection im using for the p2p server
#macro socket_t network_socket_tcp
#macro ip "34.125.216.214"
#macro tcpPort os_browser != browser_not_a_browser? 30002: 30001
#macro udpPort 30001

mic = -1;

global.instance_map		= ds_map_create();
global.client_map		= ds_map_create();
global.room_client_map	= ds_map_create();
global.messages			= ds_list_create();

room_host				= "";
depth_grid				= ds_grid_create(2, 1);

stress_test				= false;

shutdown_timer			= 0;

/*Uncomment to create additional windows for testing if have execute_shell extension installed
repeat(3){
	if(parameter_count()==3){
		execute_shell(parameter_string(0) + " "+
		parameter_string(1) + " "+
		parameter_string(2) + " "+
		parameter_string(3) + " -secondary" + " -tertiary", false)
	
		window_set_caption("P1");
		window_set_position(200, 260);
	}
	if(parameter_count() > 3){
		window_set_caption("P2");
		window_set_position(900, 260);
	}
}