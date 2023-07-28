function state_player_punch()
{
	movespeed = 0;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	if (floor(image_index) == (image_number - 1))
		state = states.normal;
	sprite_index = spr_punch;
	image_speed = 0.35;
}
