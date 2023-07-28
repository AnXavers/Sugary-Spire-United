x = playerID.x;
y = playerID.y;
if ((playerID.state != 39 && playerID.state != 101) || !playerID.grounded)
	instance_destroy();
