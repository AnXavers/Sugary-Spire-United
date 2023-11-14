if (obj_player.state != states.freefall && !(obj_player.state == states.rupertjump))
	instance_destroy();
x = obj_player.x;
y = obj_player.y + 32;
depth = obj_player.depth - 6;
