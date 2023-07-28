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
	function angle_rotate()
	{
		var diff = cycle(argument1 - argument0, -180, 180);
		if (diff < -argument2)
			return argument0 - argument2;
		if (diff > argument2)
			return argument0 + argument2;
		return argument1;
	}
}
