/// @function bnet(key)
function bnet(argument0) {

	/* @description							A simple reliable way to access BNET_NETWORKMANAGER info map without using BNET_NETWORKMANAGER as a prefix. 
											Returns noone if BNET_NETWORKMANAGER isnt initialized.
	*/
	/// @param {string} key					Map key which to return.

	/// @return								noone, or BNET_NETWORKMANAGER _bnet_info value.

#region KEYS
	/*
		{string}	bnet("type")			Type bnet was ran as. "server", "client".
		{bool}		bnet("connected")		Status connection to server.
		{string}	bnet("id")				Your id.
		{string}	bnet("name")			Your name.
		{string}	bnet("ip")				Server ip.
		{real}		bnet("tcp_port")		Server tcp/ws port.
		{real}		bnet("server_udp_port") Server udp port.
		{real}		bnet("udp_port")		Your udp port.
		{real}		bnet("ping")			Your ping.
		{string}	bnet("server")			Server client list id.
		{string}	bnet("room")			Your room id.
		{string}	bnet("room_host")		Returns the room host id.
	
		{ds_map}	bnet("voip")			Returns a ds_map with following keys:
	
			{real}   [? “mic”]				Mic index that's being used.
			{bool}	 [? “active”]			If recording active.
			{real}	 [? “time”]				How long mic been active.
	*/
#endregion

#region Examples
	/*
		Get my id.
			var my_id = bnet("id");
		
		Check if connected.
			var connected = bnet("connected");
	*/
#endregion

	if(!instance_exists(BNET_NETWORKMANAGER)) return noone;
	else return BNET_NETWORKMANAGER._bnet_info[? argument0];


}
