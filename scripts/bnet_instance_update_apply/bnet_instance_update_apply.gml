/// @function bnet_instance_update_apply(instance_id, buffer)
function bnet_instance_update_apply(argument0, argument1) {

	/// @description					Applies the updated data to the targeted instance.

	/// @param {real}	instance_id		Instance's id to apply the update to.
	/// @param {buffer} bufferid		The updated data to apply.

#region Example
	/*
		case bnet_callbacks.instance_updated:
			var 
			id_		= bnet_callback_load[? "id"],
			inst	= global.instance_map[? id_];
			
			if(inst != undefined && instance_exists(inst)) bnet_instance_update_apply(inst, bnet_callback_load[? "buffer"]);
		break;
	*/
#endregion

	var
	__bnet_buffer			= argument1,
	__bnet_instance_buffer	= argument0.bnet_info[? "read_buffer"],
	__bnet_size				= buffer_get_size(__bnet_buffer);
												
	buffer_resize(__bnet_instance_buffer, __bnet_size);

	buffer_copy(__bnet_buffer, 0, __bnet_size, __bnet_instance_buffer, 0);
												
	buffer_seek(__bnet_instance_buffer, buffer_seek_start, 0);


}
