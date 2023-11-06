x = obj_player.x;
y = obj_player.y;
if ((obj_player.state != states.grind && obj_player.state != 101) || !obj_player.grounded)
	instance_destroy();
