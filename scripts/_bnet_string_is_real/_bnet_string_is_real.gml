/// string_is_uint(string)
function _bnet_string_is_real(argument0) {
	//A helpfull script that checks whether a string contains an unsigned integer.
	//By: yellowafterlife found here: https://forum.yoyogames.com/index.php?threads/check-if-string-is-number.61305/
	var 
	s = argument0,
	n = string_length(string_digits(s));
	return n && n == string_length(s) - (string_char_at(s, 1) == "-") - (string_pos("", s) != 0);


}
