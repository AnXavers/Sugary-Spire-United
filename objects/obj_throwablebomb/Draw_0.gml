draw_self();
if (obj_player != -4 && obj_player.state == states.bombpep && obj_player.substate == states.normal)
	draw_sprite(spr_cursor, 0, obj_player.x + lengthdir_x(200, obj_player.angle), obj_player.y + lengthdir_y(200, obj_player.angle));
