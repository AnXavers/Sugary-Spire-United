hsp = sign(image_xscale) * movespeed;
if (Dashpad_buffer > 0)
	Dashpad_buffer = max(Dashpad_buffer - 1, 0);
if (sprite_index == spr_minecart)
{
	if (place_meeting(x, y - 4, obj_player) && obj_player.vsp > 0 && obj_player.state != states.minecart)
	{
		obj_player.state = states.minecart;
		if (obj_player.xscale == image_xscale)
			obj_player.movespeed = clamp(obj_player.movespeed, 3, 12);
		else
			obj_player.movespeed = clamp(obj_player.movespeed / 4, 3, 12);
		obj_player.vsp = vsp;
		obj_player.sprite_index = obj_player.spr_minecart_player;
		obj_player.x = x;
		obj_player.y = y;
		obj_player.xscale = image_xscale;
		if (!instance_exists(obj_poofeffect))
			instance_create(x, y, obj_poofeffect);
		instance_destroy(id, false);
	}
}
if (grounded && !place_meeting(x, y + 1, obj_minecartRail) && !place_meeting(x, y + 1, obj_minecartRail_Slope))
	movespeed = approach(movespeed, 0, 0.45);
if (movespeed <= 0 && sprite_index != spr_minecartend)
{
	image_index = 0;
	sprite_index = spr_minecartend;
}
