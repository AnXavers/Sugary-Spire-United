/// @function bnet_lockstep_instance_init(inputs);
function bnet_lockstep_instance_init() {

	/// @description			Adds this instance into lockstep environment.

	/// @param {array} inputs	An array of string inputs.

#region Example
	/*
		bnet_lockstep_instance_init(["left", "right", "up", "down", "shoot"]);
	*/
#endregion

	bnet_info[? "lockstep_input_array"]	= argument[0];

	//Add this instance to lockstep instance list.
	ds_list_add(BNET_NETWORKMANAGER._bnet_lockstep_instance_list, id);


}
