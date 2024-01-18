/// @function bnet_lockstep_start(delay, max_clients);
function bnet_lockstep_start(argument0, argument1) {

	/// @description				Starts lockstep. At the momment these values should remain constant per session.

	/// @param {real} delay			Intervals to apply delay to input. Good amount should be: ping / (1000 / (room_speed or fps))
	/// @param {real} max_clients	Amount of clients needed to confirm packet delivery.

	/// @call-back					lockstep_timedout

#region Example
	/*
		bnet_lockstep_start(5, 2);
	*/
#endregion

	with(BNET_NETWORKMANAGER.id){
		_bnet_lockstep_active		= true;
		_bnet_lockstep_input_delay	= argument0;
		_bnet_lockstep_sessions		= argument1;
		_bnet_lockstep_frame		= 0;
		_bnet_lockstep_timeout		= room_speed * _bnet_lockstep_input_delay;
		_bnet_lockstep_wait			= true;
	
		_bnet_logger("lockstep started");
	}


}
