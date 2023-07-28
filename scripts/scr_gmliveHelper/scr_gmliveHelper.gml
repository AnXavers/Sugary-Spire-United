function scr_room_updated()
{
	global.GMLIVE_roomstart = true;
	global.GMLIVE_realroom = argument0;
	room_goto_live(argument0);
	show_debug_message("Loading Live Room: " + string(room_get_name(argument0)));
}
