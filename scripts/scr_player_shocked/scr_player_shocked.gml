function state_player_shocked()
{
	image_speed = 0.35;
	sprite_index = spr_electrocuted;
	movespeed = 0;
	hsp = 0;
	if (ridingmarsh)
	{
		with (instance_create(x, y, obj_cookiemount))
		{
			image_xscale = obj_player.xscale;
			sprite_index = spr_cookiemounthurt;
			hsp = -image_xscale * 8;
			vsp = -8;
		}
		ridingmarsh = false;
	}
	if (animation_end())
		state = states.normal;
}
