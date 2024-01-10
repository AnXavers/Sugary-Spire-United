/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	ini_open("optionData.ini");
	var _user_id = async_load[? "user_id"]
	if !ini_key_exists("NekoPresence", "userid")
		ini_write_string("NekoPresence", "userid", _user_id);
	_user_id = ini_read_string("NekoPresence", "userid", _user_id);
	ini_close()
	if !array_contains(global.testerlist, _user_id)
		game_end();
	if global.nekocheck
	{
		global.nekocheck = false
		if !global.richpresence
		{
			instance_destroy();
			exit;
		}
	}
	ready = true;
	show_debug_message("date: " + string(date_current_datetime()));
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("Small image text", "Large image text", false);
	
	//np_setpresence() should ALWAYS come the last!!
	np_setpresence("Loading into the Sugary Spire.", "Loading into the Sugary Spire.", "ssu_richpresence", "");
	
	// passing a URL will add this sprite asynchronously via *internets*
	sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
}