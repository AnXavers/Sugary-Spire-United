function scr_pizzano_pummel()
{
	hsp = movespeed * xscale;
	movespeed = 12;
	if ((animation_end() && grounded) || move == -xscale)
		state = states.normal;
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		state = states.bump;
		hsp = -2.5 * xscale;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
	}
	if (key_down)
	{
		state = states.crouchslide;
		sprite_index = spr_coneboy_slidekick;
	}
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20;
		jumpstop = 1;
	}
	if (key_jump && grounded && !key_down)
	{
		jumpstop = 0;
		image_index = 0;
		vsp = -11;
	}
}
