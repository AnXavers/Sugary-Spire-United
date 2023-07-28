if (place_meeting(x, y, obj_player) && !active)
{
	active = true;
	image_index = 0;
	sprite_index = spr_eyescreamsandwich_popout;
}
if (sprite_index == spr_eyescreamsandwich_popout)
{
	y = lerp(y, ystart - 25, 0.1);
	if (animation_end())
	{
		tgt_x = obj_player.x;
		tgt_y = obj_player.y;
		sprite_index = spr_eyescreamsandwich_divestart;
		image_index = 0;
	}
}
if (animation_end() && sprite_index == spr_eyescreamsandwich_divestart)
	sprite_index = spr_eyescreamsandwich_dive;
if (sprite_index == spr_eyescreamsandwich_dive)
{
	var dir = point_direction(x, y, tgt_x, tgt_y);
	x = approach(x, tgt_x, lengthdir_x(16, dir));
	y = approach(y, tgt_y, lengthdir_y(16, dir));
	if (place_meeting(x, y, obj_player) || (x == tgt_x && y == tgt_y))
	{
		instance_create(x, y, obj_bombexplosionharmful);
		instance_destroy();
	}
}
