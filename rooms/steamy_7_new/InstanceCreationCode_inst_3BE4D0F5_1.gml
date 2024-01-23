flags.do_once = false;
condition = function()
{
	return place_meeting(obj_player.roomstartx, obj_player.roomstarty, self);
};
output = function()
{
	obj_camera.chargecamera = 0;
	obj_player.movespeed = 5;
	event_perform_object(obj_puddle, ev_other, ev_user0);
};
