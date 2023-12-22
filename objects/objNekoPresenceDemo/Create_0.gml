/// @description Initialize Discord.

#macro DISCORD_APP_ID "1135504653660995705"

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}

alarm[0] = (room_speed * 5)