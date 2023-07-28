draw_self();
if (playerID != -4 && playerID.state == states.bombpep && playerID.substate == states.normal)
	draw_sprite(spr_cursor, 0, playerID.x + lengthdir_x(200, playerID.angle), playerID.y + lengthdir_y(200, playerID.angle));
