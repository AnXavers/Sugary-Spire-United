function scr_mathlibs()
{
	function cycle()
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
	function Wave(from, to, duration, offset, time = noone)
	{
		var a4 = (to - from) * 0.5;
		
		var t = current_time;
		if time != noone
			t = time;
		
		return from + a4 + (sin((((t * 0.001) + (duration * offset)) / duration) * (pi * 2)) * a4);
	}
	function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5)
	{
		return abs(argument0 - argument2) <= argument4 && abs(argument1 - argument3) <= argument5;
	}
	function distance_between_points(x1, y1, x2, y2)
	{
		return sqrt(sqr(x2 - x1) + sqr(y2 - y1));
	}
}
