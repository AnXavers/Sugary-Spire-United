function state_player_cottonswim()
{
	static cotton_afterimagetimer = 6;
	var _meetingcotton = place_meeting(x, y, obj_cottonsolid)
	vsp = verticalMovespeed;
	hsp = movespeed;
	grav = 0;
	image_speed = 0.35;
	sprite_index = spr_cotton_drill
	var _futurex = x + hsp
	var _futurey = y + vsp
	if (place_meeting_solid(_futurex, _futurey, obj_solid) && (!place_meeting_slope(_futurex, _futurey) && (!place_meeting(_futurex, _futurey, obj_destructibles) && !place_meeting(_futurex, _futurey, obj_chocofrog))))
	{
		if place_meeting_solid(_futurex, y, obj_solid)
			hsp = -hsp
		if place_meeting_solid(x, _futurey, obj_solid)
			vsp = -vsp
		if (sign(hsp) == sign(movespeed) && sign(vsp) == sign(verticalMovespeed))
		{
			hsp = -hsp
			vsp = -vsp
		}
		verticalMovespeed = vsp
		movespeed = hsp
		scr_sound(sound_bump)
	}
	else if scr_slope_ext(_futurex, _futurey)
	{
		var _slope = instance_nearest(_futurex, _futurey, obj_slope)
		var _slopexdir = sign(_slope.image_xscale)
		var _slopeydir = sign(_slope.image_yscale)
		hsp = -verticalMovespeed
		vsp = movespeed
		hsp *= _slopexdir
		hsp *= _slopeydir
		movespeed = hsp
		verticalMovespeed = vsp
		scr_sound(sound_bump)
	}
	draw_angle = point_direction(x, y, x + hsp, y + vsp) + 90
	if !_meetingcotton
	{
		state = states.cotton
		sprite_index = spr_cotton_fall
		draw_angle = 0
		movespeed *= xscale
	}
	if (cotton_afterimagetimer > 0)
		cotton_afterimagetimer--;
	else
		cotton_afterimagetimer = 6;
}