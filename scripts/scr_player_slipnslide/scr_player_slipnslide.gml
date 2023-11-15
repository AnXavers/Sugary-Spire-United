function state_player_slipnslide()
{
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	hsp = xscale * movespeed;
	movespeed = approach(movespeed, 0, 0.19);
	machhitAnim = 0;
	crouchslideAnim = 1;
	if (movespeed <= 0)
	{
		state = states.normal;
		movespeed = 0;
		mach2 = 0;
		image_index = 0;
	}
	if (place_meeting_collision(x + xscale, y, 1) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		state = states.jump;
		vsp = -12;
		jumpstop = 1;
		movespeed = 0;
	}
	sprite_index = spr_slippingonice;
	image_speed = 0.35;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 1.5)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.xscale;
	}
}
