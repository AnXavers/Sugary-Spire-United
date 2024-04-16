function cycle(argument0, argument1, argument2)
{
	var delta = argument2 - argument1;
	var result = (argument0 - argument1) % delta;
	if (result < 0)
		result += delta;
	return result + argument1;
}