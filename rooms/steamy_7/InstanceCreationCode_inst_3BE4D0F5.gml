flags.do_once = false;
condition = function()
{
	var _check = false;
	with (obj_player)
	{
		if (place_meeting(roomstartx, roomstarty, other))
			_check = true;
	}
	return _check;
};
output = function()
{
	obj_camera.chargecamera = 0;
	obj_player.movespeed = 5;
	event_perform_object(obj_puddle, ev_other, ev_user0);
};
