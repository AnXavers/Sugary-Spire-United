if (room != room_gmliveblank)
	room_set_live(room, true);
if (!surface_exists(surf_pallete))
	surf_pallete = surface_create(surf_width, surf_height);
scr_playercolors();
customupdate = true;
event_user(0);