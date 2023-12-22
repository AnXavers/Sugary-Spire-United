fadealpha = 0;
fadein = true;
gotonoplayer = 0;
depth = -9999;
if global.richpresence && !instance_exists(objNekoPresenceDemo)
	instance_create(-1000, -1000, objNekoPresenceDemo)
else if !global.richpresence
	instance_destroy(objNekoPresenceDemo)