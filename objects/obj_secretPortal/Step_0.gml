if (savedActivate != secretActivated)
	event_user(0);
depth = (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_metalblock)) ? 1000 : 10;