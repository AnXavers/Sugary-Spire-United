if (!instance_exists(ID) || (obj_player.state == 70 || obj_player.state == 121 || obj_player.state == 104 || obj_player.state == 101))
	exit;
event_inherited();
