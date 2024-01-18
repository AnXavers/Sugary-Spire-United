/// @description KEEP THIS OBJECT AT BOTTOM OF OBJECT RESOURCE LIST
/*
BY: BAHAMAGAMES
contacts for further assistance :D
email: bahamagames@gmail.com 
discord: rickky#1696

version: 2.0.0
last updated: 4/ 30/ 2022

DO NOT EDIT THIS OBJECT BESIDES THE LISTED BELOW VARIABLES!!!
CHECK THE RELEASE NOTES LISTED IN NOTES FOR UPDATED CHANGES AND KNOWN BUGS
*/
#region DO NOT EDIT
//Singleton to ensure only one bnet instance is running.
if(instance_number(BNET_NETWORKMANAGER) > 1) {
	_bnet_type = undefined;
	
	_bnet_logger("Trying to create an additional bnet instance!!!");
	
	instance_destroy();
	
	exit;
}

enum bnet_callbacks{
	onError,
	version_checked,
	
	server_created,
	server_shutting_down,
	server_shut_downed,
	server_destroyed,
	
	connected,
	disconnected,
	client_connected,
	client_disconnected,
	
	room_joined,
	room_lefted,
	room_updated,
	room_client_joined,
	room_client_lefted,
	
	instance_created,
	instance_updated,
	instance_destroyed,
	
	lockstep_started,
	lockstep_stopped,
	lockstep_timedout,
	
	namespace_created,
	namespace_updated,
	namespace_destroyed,
	
	chat_updated,
	voip_turned_off,
	voip_turned_on,
	voip_updated,
	
	mongodb_database_created,
	mongodb_databases_loaded,
	mongodb_database_destroyed,
	
	mongodb_collection_created,
	mongodb_collections_loaded,
	mongodb_collection_destroyed,
	
	mongodb_document_created,
	mongodb_documents_loaded,
	mongodb_document_updated,
	mongodb_document_destroyed,
	
	file_created,
	file_loaded,
	file_updated,
	file_destroyed,
	
	email_sent
}

global._bnet_callback_load			= -1;
#macro bnet_callback_load			global._bnet_callback_load
global._bnet_callback_list			= ds_list_create();
global._bnet_callback_prev			= -1;
#macro bnet_data_start				(!variable_global_exists("_bnet_callback_list")? false: (global._bnet_callback_list != undefined? !ds_list_empty(global._bnet_callback_list): false))
#macro bnet_data_end				_bnet_callback_cleanup()
#macro bnet_callback				_bnet_callback()
#macro _bnet_is_ws					(os_browser != browser_not_a_browser || BNET_NETWORKMANAGER._bnet_connection_type == "1")
global._bnet_callback_cleanup_		= false;

_bnet_tcp_socket					= undefined;
_bnet_udp_socket					= undefined;
		
_bnet_socket_type					= "";
_bnet_ping							= 0;

_bnet_system_time					= get_timer();
_bnet_prev_time						= _bnet_system_time;
_bnet_time_passed					= 0;

_bnet_connection_type				= "0";
_bnet_id							= "";
_bnet_name							= "";
_bnet_ip							= "127.0.00.1";

_bnet_tcp_port						= 30001;
_bnet_server_udp_port				= 30001;
_bnet_udp_port						= 6510;

_bnet_buffer_cache_list				= ds_list_create();
_bnet_decoder_list					= ds_list_create();

_bnet_buffer_udp_cache_list			= ds_list_create();
_bnet_buffer_udp_cache_map			= ds_map_create();

_bnet_write_buffer					= buffer_create(1, buffer_grow, 1);
_bnet_tcp_buffer					= buffer_create(1, buffer_grow, 1);
_bnet_stream_buffer					= buffer_create(1, buffer_grow, 1);
_bnet_missing_bytes					= 0;

alarm[2]							= 1;
alarm[3]							= 1;
alarm[4]							= 10;

_bnet_info							= ds_map_create();

_bnet_room_host						= "";
_bnet_server_client_map				= undefined;
_bnet_server_client_list			= undefined;

_bnet_server_room_map				= undefined;
_bnet_server_room_list				= undefined;
	
_bnet_server_namespace_map			= undefined;
_bnet_server_namespace_list			= undefined;

//Stores all list
_bnet_server_list_map				= undefined;

//Local server client map
_bnet_server_local_client_map		= undefined;
//Used for quick access to server client room list.
_bnet_server_local_room_list		= undefined;
//Used for quick access to server client room map.
_bnet_server_local_room_map			= undefined;

//Stores the id of my current room.
_bnet_room_id						= "";

//Stores the id of the server client list.
_bnet_client_list					= undefined;

#region Lockstep
_bnet_lockstep_instance_list		= ds_list_create();
_bnet_lockstep_map					= ds_map_create();

_bnet_lockstep_frame				= 0;
_bnet_lockstep_input_delay			= 5;//ping / (1000/room_speed)
_bnet_lockstep_sessions				= 2;
_bnet_lockstep_timeout				= room_speed;

_bnet_lockstep_wait					= true;
_bnet_lockstep_active				= false;
#endregion

//MY INFO
_bnet_info[? "type"]				= "";
_bnet_info[? "connected"]			= false;
_bnet_info[? "id"]					= "";
_bnet_info[? "name"]				= "";
_bnet_info[? "ip"]					= "";

_bnet_info[? "tcp_port"]			= -1;
_bnet_info[? "server_udp_port"]		= -1;
_bnet_info[? "udp_port"]			= -1;
_bnet_info[? "ping"]				= 0;

_bnet_info[? "server"]				= "";
_bnet_info[? "room"]				= "";
_bnet_info[? "room_host"]			= "";

_bnet_info[? "ws"]					= _bnet_is_ws;

#region VOIP ESSENTIALS
_bnet_info[? "voip"]				= ds_map_create();
var 
_bnet_map							= _bnet_info[? "voip"],
_bnet_mic,
_bnet_array;

_bnet_map[? "active"]				= false;
_bnet_map[? "record_timer"]			= -1;
_bnet_map[? "send_rate"]			= 10;
_bnet_map[? "mics"]					= audio_get_recorder_count();
_bnet_map[? "mic"]					= -1;
_bnet_map[? "channel"]				= -1;
_bnet_map[? "mic_info"]				= [];
_bnet_map[? "buffer"]				= buffer_create(1, buffer_grow, 1);
_bnet_map[? "list"]					= ds_list_create();
_bnet_map[? "length"]				= 0;
_bnet_map[? "time"]					= 0;

_bnet_array							= _bnet_map[? "mic_info"];

if(_bnet_map[? "mics"] > 0){
	for(var i = 0; i < _bnet_map[? "mics"]; i++;){
		_bnet_mic					= audio_get_recorder_info(i);
		_bnet_array[@ i, 0]			= _bnet_mic[? "index"];
		_bnet_array[@ i, 1]			= _bnet_mic[? "name"];
		_bnet_array[@ i, 2]			= _bnet_mic[? "sample_rate"];
		
		ds_map_destroy(_bnet_mic);
	}
	
	_bnet_map[? "mic"]				= clamp(_bnet_map[? "mic"], 0, _bnet_map[? "mics"]-1);
	
	_bnet_map[? "record_timer"]		= _bnet_map[? "send_rate"];
}

#endregion

_bnet_info[? "frame"]				= 0;
_bnet_info[? "delay"]				= _bnet_lockstep_input_delay;
#endregion

//The following can be edited:
#macro _bnet_version					"1.0.0"		//CLIENT VERSION
#macro _bnet_attempt_connect_timeout	3000		//HOW MANY MILLISECONDS BEFORE DISCONNECTING FROM ATTEMPT CONNECT. DEFAULT: (3 secs)
#macro _bnet_connection_timeout			20			//HOW MANY SECONDS BEFORE DISCONNECTING FROM SERVER. DEFAULT: (20 secs)
#macro _bnet_ping_rate					20			//FREQUENCY TO PING TO SERVER. DEFAULT: 20(.4sec).
#macro _bnet_debug						true		//SHOW DEBUG LOG IN CONSOLE.
#macro _bnet_mtu						700			//UDP MAXIMUM TRANSMIT UNIT. BEST KEPT BETWEEN 576 - 1500. DEFAULT: 700.
#macro _bnet_congestion_thresh			255			//IF CLIENT PING, OR PACKET ARRAY LENGTH > THAN THRESH DROP PACKET. DEFAULT: 255.