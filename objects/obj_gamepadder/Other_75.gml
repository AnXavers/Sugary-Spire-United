show_debug_message("Event = " + ds_map_find_value(async_load, "event_type"));
show_debug_message("Pad = " + string(ds_map_find_value(async_load, "pad_index")));
switch (ds_map_find_value(async_load, "event_type"))
{
	case "gamepad discovered":
		var padnew = ds_map_find_value(async_load, "pad_index");
		if (global.player_input_device <= 0)
		{
			if (room != realtitlescreen)
			{
				gamepad_discovered = 1;
				confirmspr = spr_chargershitbox;
			}
		}
		break;
	case "gamepad lost":
		var padlost = ds_map_find_value(async_load, "pad_index");
		if (global.player_input_device == padlost)
		{
			global.player_input_device = -4;
			device_to_reconnect = 1;
		}
		else
		{
			gamepad_discovered = 0;
			confirmspr = spr_player_machpunch2;
		}
		break;
}
