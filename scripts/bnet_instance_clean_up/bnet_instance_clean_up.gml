/// @function bnet_instance_cleanup()
function bnet_instance_clean_up() {

	/*  @description	Proper way to clean up bnet created instances. Suggested
						to be placed within the instance's clean up event.
	*/

	if(bnet_info != undefined){
		if(ds_map_size(bnet_info) == 6){
			buffer_delete(bnet_info[? "read_buffer"]);
	
			buffer_delete(bnet_info[? "write_buffer"]);
		}
	
		ds_map_destroy(bnet_info);
	
		bnet_info = undefined;
	}


}
