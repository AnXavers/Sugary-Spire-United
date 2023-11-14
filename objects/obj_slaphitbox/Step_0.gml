image_xscale = obj_player.xscale;
x = obj_player.x;
y = obj_player.y;
if ((obj_player.image_index > 3 || obj_player.state != 4) && obj_player.state != 17 && obj_player.state != 3 && obj_player.state != states.pizzano_shoulderbash)
	instance_destroy();
