function state_player_comingoutdoor()
{
	static darkColor = 0;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	hsp = 0;
	vsp = 0;
	sprite_index = spr_walkfront;
	image_speed = 0.35;
	if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_exitgate) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
	{
		darkColor = image_index / image_number;
		image_blend = make_color_hsv(0, 0, darkColor * 255);
	}
	if (animation_end())
	{
		start_running = 1;
		movespeed = 0;
		state = 1;
		image_alpha = 1;
		image_blend = make_color_hsv(0, 0, 255);
	}
	global.combofreeze = 30;
}
