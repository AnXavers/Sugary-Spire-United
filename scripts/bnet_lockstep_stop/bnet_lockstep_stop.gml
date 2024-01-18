/// @function bnet_lockstep_stop(inputs);
function bnet_lockstep_stop() {

	/// @description	Adds this instance into lockstep environment.

	with(BNET_NETWORKMANAGER.id){
		for (var k = ds_map_find_first(_bnet_lockstep_map); k != undefined; k = ds_map_find_next(_bnet_lockstep_map, k)) buffer_delete(array_get(_bnet_lockstep_map[? k], 1));
		
		ds_map_clear(_bnet_lockstep_map);
	
		_bnet_lockstep_frame	= 0;
	
		_bnet_lockstep_wait		= true;
		
		_bnet_lockstep_active	= false;
		
		ds_list_clear(_bnet_lockstep_instance_list);
	
		_bnet_logger("lockstep stopped");
	}


}
