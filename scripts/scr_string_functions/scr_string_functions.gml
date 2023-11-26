// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function capitalize_section(argument0, argument1, argument2)
{
	var _str = argument0
	var _lower = argument1
	var _upper = argument2
	var _substr = string_delete(_str, (_upper + 1), string_length(_str))
	_substr = string_delete(_substr, 0, (_lower - 1))
	_substr = string_upper(_substr)
	_str = string_delete(_str, _lower, ((_upper - _lower) + 1))
	_str = string_insert(_substr, _str, _lower)
	return _str
}
