with obj_player
{
	image_index = 0;
	image_speed = 0.35;
	sprite_index = spr_slipnslidestart;
	state = states.puddle;
	vsp = -11;
	grounded = 0;
}
scr_sound(sfx_slip);
instance_destroy();
