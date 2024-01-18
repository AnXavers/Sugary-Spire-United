/// @function _bnet_instance_create(x, y, depth/layer, obj, id, *data, *cache, *room_id, *self)
function _bnet_instance_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	/*	@description	  						BASE HELPER FUNCTION FOR INSTANCE CREATION
	*/

	/// @param {real}			x				The x position the object will be created at.
	/// @param {real}			y				The y position the object will be created at.
	/// @param {real/string}	depth/layer		The depth to assign the created instance to.
	/// @param {real}			obj				The object index of the object to create an instance of.
	/// @param {string}			id				The unique id to assign the created instance to.
	/// @param {array}			data			*OPTIONAL Variables you wish to have updated upon creation. Similar effect to with(instance_create_depth()){}. Suggested to use bnet_instance_init_data(); DEFAULT: []
	/// @param {bool}			cache			*OPTIONAL Cache this instance on the server. Useful for when wanting to load in instances. DEFAULT: false. BEWARE DESTROY WHEN DONE!!!
	/// @param {string}			room_id			*OPTIONAL Room id you wish to create the instance. DEFAULT: bnet("room_id").
	/// @param {bool}			self			*OPTIONAL Should also request to send this instance back to myself.

	with(BNET_NETWORKMANAGER.id){
		var
		__bnet_x		= argument0,
		__bnet_y		= argument1,
		__bnet_depth	= _bnet_string_is_real(argument2)? argument2: other.depth,
		__bnet_layer	= !_bnet_string_is_real(argument2)? argument2: "Instances",
		__bnet_object	= argument3,
		__bnet_id		= argument4,
		__bnet_data		= argument5,
		__bnet_cache	= argument6,
		__bnet_room_id	= argument7,
		__bnet_self		= argument8,
		__bnet_size		= (array_length_2d(__bnet_data, 0) > 0? array_height_2d(__bnet_data): 0),
		__bnet_owner_id	= _bnet_id;
	
		buffer_seek(_bnet_write_buffer , buffer_seek_start, 0);
	
		buffer_write(_bnet_write_buffer, buffer_s8,		3);
		buffer_write(_bnet_write_buffer, buffer_s8,		0);
		buffer_write(_bnet_write_buffer, buffer_string, __bnet_room_id);
		buffer_write(_bnet_write_buffer, buffer_bool,	__bnet_self);
		buffer_write(_bnet_write_buffer, buffer_bool,	__bnet_cache);
	
		buffer_write(_bnet_write_buffer, buffer_s32,    __bnet_x);
		buffer_write(_bnet_write_buffer, buffer_s32,    __bnet_y);
		buffer_write(_bnet_write_buffer, buffer_s32,    __bnet_depth);
		buffer_write(_bnet_write_buffer, buffer_string, object_get_name(__bnet_object));
		buffer_write(_bnet_write_buffer, buffer_string, "");
		buffer_write(_bnet_write_buffer, buffer_string,	__bnet_layer);
		buffer_write(_bnet_write_buffer, buffer_string, __bnet_id);
		buffer_write(_bnet_write_buffer, buffer_string,	__bnet_owner_id);
		buffer_write(_bnet_write_buffer, buffer_u16,	__bnet_size);
	
		for(var i = 0; i < __bnet_size; i++){
			buffer_write(_bnet_write_buffer, buffer_string, __bnet_data[i, 0]);
		
			buffer_write(_bnet_write_buffer, buffer_string, __bnet_data[i, 1]);
		
			switch(__bnet_data[i, 1]){
				case "m": buffer_write(_bnet_write_buffer, buffer_string, ds_map_write(__bnet_data[i, 2]));			break;
				case "l": buffer_write(_bnet_write_buffer, buffer_string, ds_list_write(__bnet_data[i, 2]));		break;
				case "q": buffer_write(_bnet_write_buffer, buffer_string, ds_queue_write(__bnet_data[i, 2]));		break;
				case "p": buffer_write(_bnet_write_buffer, buffer_string, ds_priority_write(__bnet_data[i, 2]));	break;
				case "g": buffer_write(_bnet_write_buffer, buffer_string, ds_grid_write(__bnet_data[i, 2]));		break;
				case "s": buffer_write(_bnet_write_buffer, buffer_string, ds_stack_write(__bnet_data[i, 2]));		break;
				default:  buffer_write(_bnet_write_buffer, buffer_string, __bnet_data[i, 2]);						break;
			}
		}
	}


}
