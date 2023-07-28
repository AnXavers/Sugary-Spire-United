if (room != room_gmliveblank)
	room_set_live(room, true);
if (!surface_exists(surf_pallete))
	surf_pallete = surface_create(surf_width, surf_height);
scr_playercolors();
customupdate = true;
if (!global.GMLIVE_roomstart)
	event_user(0);
if (global.GMLIVE_prevroom != global.GMLIVE_realroom)
{
	room_set_live(global.GMLIVE_prevroom, false);
	global.GMLIVE_prevroom = global.GMLIVE_realroom;
}
global.GMLIVE_roomstart = false;
