draw_text(x, y - 80, bnet_info[? "id"]);

draw_text(x, y+ 120, string(x)+" :: "+string(y));

// Draw target position
if (!is_player) {
	// Draw points the player has to move across
	for(var i = 0; i < ds_list_size(goto); i++) {
		var p = goto[| i];
		
		draw_line_color(p[0]-10, p[1],   p[0]+10, p[1],   c_red,  c_red);
		draw_line_color(p[0]  , p[1]-10, p[0],   p[1]+10, c_blue, c_blue);
	}
}

if(voip > 0 && voip_blink < 0){
	draw_circle_color(x, y-120, 5, c_lime, c_lime, false);
	
	voip_blink = 40;
}

draw_self();