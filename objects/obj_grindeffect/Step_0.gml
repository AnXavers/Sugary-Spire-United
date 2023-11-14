x = obj_player.x;
y = obj_player.y;
if ((obj_player.state != states.grind && obj_player.state != states.minecart) || !obj_player.grounded)
	instance_destroy();
