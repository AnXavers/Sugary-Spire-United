if (is_player) {
	if (move_h != 0 || move_v != 0){
		if(move_h != 0) image_xscale = clamp(move_h, -1, 1);
		
		sprite_index = BNET_DEMO_PLAYER_WALK;
	}else sprite_index = BNET_DEMO_PLAYER_IDLE;
}else{
	var dis = point_distance(x, y, x_goto, y_goto);
	
	if(dis > 7.) sprite_index = BNET_DEMO_PLAYER_WALK;
	else sprite_index	= BNET_DEMO_PLAYER_IDLE;
	
	if(dis > 2.){
		if(x_goto > x_goto_prev) image_xscale = 1;
		else if(x_goto < x_goto_prev) image_xscale = -1;
	}
}