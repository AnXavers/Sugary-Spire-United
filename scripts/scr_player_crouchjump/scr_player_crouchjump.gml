function state_player_crouchjump()
{
	move = key_left + key_right;
	fallinganimation++;
	if (fallinganimation >= 40 && fallinganimation < 80)
	{
		sprite_index = spr_facestomp;
		state = states.jump;
	}
	mask_index = spr_crouchmask;
	hsp = move * movespeed;
	movespeed = 4;
	if (!key_jump2 && jumpstop == 0 && jumpAnim == 1)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (scr_solid(x, y - 1) && jumpstop == 0 && jumpAnim == 1)
	{
		vsp = grav;
		jumpstop = 1;
	}
	if (grounded && key_down)
	{
		state = states.crouch;
		jumpAnim = 1;
		crouchAnim = 1;
		image_index = 0;
		jumpstop = 0;
	}
	if (grounded && !key_down && !scr_solid(x, y - 16))
	{
		movespeed = 0;
		state = 1;
		jumpAnim = 1;
		landAnim = 1;
		crouchAnim = 1;
		image_index = 0;
		jumpstop = 0;
		mask_index = obj_player.spr_mask;
	}
	if (grounded)
	{
		state = states.crouch;
		jumpAnim = 1;
		crouchAnim = 1;
		image_index = 0;
		jumpstop = 0;
	}
	if (jumpAnim == 1)
	{
		sprite_index = spr_crouchjump;
		if (floor(image_index) == (image_number - 1))
			jumpAnim = 0;
	}
	if (jumpAnim == 0)
		sprite_index = spr_crouchfall;
	if (move != 0)
		xscale = move;
	image_speed = 0.35;
}
