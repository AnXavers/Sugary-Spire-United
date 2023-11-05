if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == 121 || obj_player.state == 104 || obj_player.state == 101))
	exit;
event_inherited();
