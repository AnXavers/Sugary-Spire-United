function state_player_throw()
{
	movespeed = 0;
	mach2 = 0;
	if (grounded)
		hsp = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	sprite_index = spr_punch;
	if (floor(image_index) == (image_number - 1))
		state = states.normal;
	image_speed = 0.35;
}
