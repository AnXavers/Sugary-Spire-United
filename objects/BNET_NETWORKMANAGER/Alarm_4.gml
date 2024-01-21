/// @description VOIP CLEANUP
var
__bnet_map	= _bnet_info[? "voip"],
__bnet_list	= __bnet_map[? "list"],
__bnet_size = ds_list_size(__bnet_list),
__bnet_snd;
	
for(var i = 0; i < __bnet_size; i += 2;){
	__bnet_snd = __bnet_list[| i];
	
	if(audio_is_playing(__bnet_snd)) break;
		
	audio_free_buffer_sound(__bnet_snd);
            
	buffer_delete(__bnet_list[| i+1]);
									
	ds_list_delete(__bnet_list, i+1);
	
	ds_list_delete(__bnet_list, i);
		
	i -= 2;
	
	__bnet_size -= 2;
}

alarm[4] = 10;