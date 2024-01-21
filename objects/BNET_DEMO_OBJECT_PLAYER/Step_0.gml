//Only send data if moving.
voip--;
voip_blink--;
is_player = bnet_instance_update_player(last_x != x || last_y != y? 2: -1);

//Exit event if its locked

#region Local
//Update client
if (is_player){
	//Update last pos since sending data.
	if(is_player == 2){
		last_x	= x;
		last_y	= y;
	}
	
	move_h = -keyboard_check(ord("A")) + keyboard_check(ord("D"));
	move_v = -keyboard_check(ord("W")) + keyboard_check(ord("S"));
	
	// Normalize speed when moving diaognally
	var d = 1;
	if (move_h != 0 && move_v != 0) d = sqrt(2);
	
	hspd = clamp(move_h, -1, 1) * reducedSpd / d; 
	vspd = clamp(move_v, -1, 1) * reducedSpd / d;

	x += hspd;
	y += vspd;
}
#endregion

#region Remote
else{
	//Reset inputs
	k_up		= false;
	k_down		= false;
	k_left		= false;
	k_right		= false;
	
	var 
	dis			= point_distance(x, y, x_goto, y_goto),
	list_size	= ds_list_size(goto),
	cond		= abs(y_goto - y) <= walkSpd && abs(x_goto - x) <= walkSpd;
	
	// Pop points
	while (cond) {
		// We are close enough. Go to the next point
		if (list_size > 0) {
			var p = goto[| 0];
			
			list_size--;
			
			// Use this to update xscale since player isnt actually following *_goto.
			x_goto_prev = x_goto;
			y_goto_prev = y_goto;
			
			x_goto	= p[0];
			y_goto	= p[1];
			
			x = lerp(x, x_goto, delta_time / 1000000);
			y = lerp(y, y_goto, delta_time / 1000000);
			
			ds_list_delete(goto, 0);
		} else break;
		
		cond = abs(y_goto - y) <= walkSpd && abs(x_goto - x) <= walkSpd;
	}
	
	// Only move when above a threshold. prevents wobblyness
	if (abs(y_goto - y) > reducedSpd) {
		k_up	= ((y_goto - y) < 0);
		k_down	= ((y_goto - y) > 0);
	}
		
	if (abs(x_goto - x) > reducedSpd) {
		k_left	= ((x_goto - x) < 0);
		k_right = ((x_goto - x) > 0);
	}
	
	// Dynamically adjust the player speed as they approach closer to the endpoint (for smoothness)
	// So technically we almost never reach the endpoint, but only if there's very few points left
	if (list_size < 2) {
		if (dis < walkSpd) {
			//minSpeed , maxSpeed when slowing down to endpoint.
			mul_goto = max(walkSpd / 3, dis / (walkSpd * 5));
		
			k_right *= mul_goto;
			k_up	*= mul_goto;
			k_left	*= mul_goto;
			k_down	*= mul_goto;
		}
	} else if (list_size > 5) {
		mul_goto = min(walkSpd, list_size / 3);
		
		k_right *= mul_goto;
		k_up	*= mul_goto;
		k_left	*= mul_goto;
		k_down	*= mul_goto;
	}
	
	x += k_right - k_left;
	y += k_down - k_up;
}
#endregion