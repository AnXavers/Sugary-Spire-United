/// @function bnet_voip(mic_index, *list, *rate, *reliable)
function bnet_voip() {

	/// @description					Sends audio data.

	/// @param {real}	mic_index		Mic to use to send voip? -1 Means off.
	/// @param {real}	*rate			OPTIONAL Intervals at which to send data. DEFAULT: 10.
	/// @param {string} *list			OPTIONAL Which list to target. bnet(server), bnet("room"), "namespace_id". Default: bnet("server").
	/// @param {bool}	*reliable		OPTIONAL Send this voice message using tcp. Good for sending voice note that should be saved. DEFAULT: false.				

	/// @call-back						voip_turned_on, voip_turned_off

	/// @error-codes					"102", "103"

#region Example
	/*
		Get how long mic been active.
			var map = bnet("voip");
			mic_active_duration = map[? "time"];
	
		Display all connected mic info.
			for(var i = 0; i < audio_get_recorder_count(); i++){
				var map = audio_get_recorder_info(i);
				draw_text(360, yy, string(map[? "index"])+" :: "+map[? "name"]+" :: "+string(map[? "sample_rate"]));
				yy += 20;
			}
	
		If pressing down spacebar use mic indexed at 1, else set mic to -1 disabling voip.
			bnet_voip((keyboard_check(vk_space)? 1: -1), 1, bnet("server"));
		
		Check function: audio_get_recorder_count(), and audio_get_recorder_info() for better understanding.
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		var 
		__bnet_mic  = argument[0],
		__bnet_list = (argument_count > 2? string(argument[2]): _bnet_client_list),
		__bnet_map  = _bnet_info[? "voip"],
		__bnet_rate = (argument_count > 1? argument[1]: __bnet_map[? "send_rate"]),
		__bnet_tcp  = (argument_count > 2? argument[2]: (!_bnet_is_ws? false: true));
			
		//If voip set to enabled.
		if(__bnet_mic > -1){
			var __bnet_mic_count = audio_get_recorder_count();
				
			if(__bnet_mic > __bnet_mic_count - 1){
				if(__bnet_map[? "active"]){
					audio_stop_recording(__bnet_map[? "channel"]);
						
					__bnet_map[? "channel"] = -1;
					__bnet_map[? "active"]  = false;
				
					_bnet_callback_push(bnet_callbacks.voip_turned_off);
				
					_bnet_logger("VOIP ERROR, VOIP TURNED OFF, INDEX EXCEEDS AVAILABLE MIC COUNT");
				}else _bnet_logger("VOIP ERROR, INDEX EXCEEDS AVAILABLE MIC COUNT");
			
				__bnet_map				= ds_map_create();
				__bnet_map[? "error"]	= "103";
	
				_bnet_callback_push(bnet_callbacks.onError, __bnet_map);
				
				exit;
			}
		
			//and isnt active as yet
			if(!__bnet_map[? "active"]){
				//Create an audio channel.
				__bnet_map[? "mics"]	= __bnet_mic_count;
				__bnet_map[? "length"]	= 0;
				__bnet_map[? "time"]	= 0;
			
				//If any mic input were found.
				if(__bnet_map[? "mics"] > 0){
					var 
					__bnet_map_,
					__bnet_arr;
						
					for(var i = 0; i < __bnet_map[? "mics"]; i++;){
						__bnet_map_			= audio_get_recorder_info(i);
						__bnet_arr			= __bnet_map[? "mic_info"];
							
						__bnet_arr[@ i, 0]	= __bnet_map_[? "index"];
						__bnet_arr[@ i, 1]	= __bnet_map_[? "name"];
						__bnet_arr[@ i, 2]	= __bnet_map_[? "sample_rate"];
					
						ds_map_destroy(__bnet_map_);
					}
				
					//Ensure the index selected is within range.
					__bnet_map[? "mic"] = __bnet_mic;
				
					buffer_seek(__bnet_map[? "buffer"], buffer_seek_start, 0);
				
					//Start audio input stream.
					__bnet_map[? "channel"]			= audio_start_recording(__bnet_mic);
					__bnet_map[? "record_timer"]	= __bnet_rate;
				}
			
				//Set active to true.
				__bnet_map[? "active"]				= true;
			
				_bnet_callback_push(bnet_callbacks.voip_turned_on);
			
				//alarm[4]
				_bnet_logger("VOIP TURNED ON");
			}else{//STREAM THROUGH AUDIO CHANNEL
				__bnet_map[? "time"]++;
			
				if(__bnet_map[? "record_timer"] > 0){
					__bnet_map[? "record_timer"]--;
				
					//If timers up send data
					if(__bnet_map[? "record_timer"] <= 0){
							
						var __bnet_size	= __bnet_map[? "length"];
							
						buffer_seek(_bnet_write_buffer, buffer_seek_start, 0);
					
						buffer_write(_bnet_write_buffer, buffer_s8, 1);
						buffer_write(_bnet_write_buffer, buffer_s8, 1);
						buffer_write(_bnet_write_buffer, buffer_string, __bnet_list);
						__bnet_arr = __bnet_map[? "mic_info"];
						buffer_write(_bnet_write_buffer, buffer_s16, __bnet_arr[__bnet_mic, 2]);//Sample rate
						buffer_write(_bnet_write_buffer, buffer_u16, __bnet_map[? "time"]);
						buffer_write(_bnet_write_buffer, buffer_u16, __bnet_size);
							
						if(_bnet_type == 0){
							_bnet_client_serialize(_bnet_write_buffer, _bnet_server_local_client_map);
						
							buffer_copy(__bnet_map[? "buffer"], 0, __bnet_size, _bnet_write_buffer, buffer_tell(_bnet_write_buffer));
						
							buffer_resize(_bnet_write_buffer, buffer_tell(_bnet_write_buffer) + __bnet_size);
						
							var __bnet_target_list = _bnet_server_list_map[? __bnet_list];
						
							if(__bnet_tcp) _bnet_network_send_broadcast_tcp(__bnet_target_list, _bnet_write_buffer, _bnet_server_local_client_map);
							else _bnet_network_send_broadcast_udp(_bnet_id, __bnet_target_list, _bnet_write_buffer, _bnet_server_local_client_map);
						}else{
							buffer_copy(__bnet_map[? "buffer"], 0, __bnet_size, _bnet_write_buffer, 9 + string_length(__bnet_list));
						
							if(__bnet_tcp) _bnet_network_send_raw(_bnet_id, _bnet_tcp_socket, _bnet_write_buffer, 9 + string_length(__bnet_list) + __bnet_size);
							else{
								buffer_resize(_bnet_write_buffer, 9 + string_length(__bnet_list) + __bnet_size);
							
								_bnet_network_send_udp_raw(_bnet_id, _bnet_udp_socket, _bnet_ip, _bnet_server_udp_port, _bnet_write_buffer, _bnet_mtu, _bnet_ping, _bnet_congestion_thresh);
							}
						}
							
						buffer_seek(__bnet_map[? "buffer"], buffer_seek_start, 0);
								
						__bnet_map[? "record_timer"]	= __bnet_rate;
						__bnet_map[? "length"]			= 0;
					}
				}
			}
		}else{//DESTROY EXISTING AUDIO CHANNELS
			if(__bnet_map[? "active"]){
				audio_stop_recording(__bnet_map[? "channel"]);
			
				__bnet_map[? "channel"] = -1;
				__bnet_map[? "active"]  = false;
			
				_bnet_callback_push(bnet_callbacks.voip_turned_off);
			
				_bnet_logger("VOIP TURNED OFF");
			}
		}
	}


}
