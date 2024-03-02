if obj_player.lastcottonspring == id
{
	doublejumped = 1;
	movespeed = 0;
	hsp = movespeed
	state = states.cotton;
	vsp = -10;
	verticalMovespeed = vsp
	grav = 0.1;
	image_index = 0;
	sprite_index = spr_cotton_doublejump;
	instance_create(x, y, obj_highjumpcloud2);
	with (instance_create(x, y, obj_highjumpcloud2))
	{
		image_xscale = obj_player.xscale;
		sprite_index = spr_cottonpoof;
	}
	scr_sound(sfx_cottonjump);
}