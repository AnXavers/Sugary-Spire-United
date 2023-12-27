if (pizz_x != 0 && pizz_y != 540)
{
	var d = point_direction(xstart, ystart, 0, 540);
	pizz_x = approach(pizz_x, 0, lengthdir_x(5, d));
	pizz_y = approach(pizz_y, 540, lengthdir_y(5, d));
	pizz_y = max(pizz_y, 540);
	pizz_x = min(pizz_x, 0);
}
if (animation_end() && sprite_index == spr_pizzano_hudpress)
	sprite_index = spr_pizzano_hud;
switch (state)
{
	case states.normal:
		break;
	case states.throwing:
		if (animation_end(undefined, 4))
		{
			var cur_trap = instance_nearest(trap_x, trap_y, obj_pizzanotrap_parent);
			with (cur_trap)
				event_user(0);
			state = 1;
		}
		break;
}
