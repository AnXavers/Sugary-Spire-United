function scr_mathlibs(argument0, argument1, argument2)
{
	function cycle(argument0, argument1, argument2)
	{
		var delta = argument2 - argument1;
		var result = (argument0 - argument1) % delta;
		if (result < 0)
			result += delta;
		return result + argument1;
	}
	function angle_rotate(argument0, argument1, argument2)
	{
		var diff = cycle(argument1 - argument0, -180, 180);
		if (diff < -argument2)
			return argument0 - argument2;
		if (diff > argument2)
			return argument0 + argument2;
		return argument1;
	}
	function get_velocity(a, b)
	{
		return a / b;
	}
	function distance_between_points(x1, y1, x2, y2)
	{
		return sqrt(sqr(x2 - x1) + sqr(y2 - y1));
	}
}
