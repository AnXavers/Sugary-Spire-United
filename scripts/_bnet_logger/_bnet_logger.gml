/// @function _bnet_logger(message)
function _bnet_logger(argument0) {

	/// @description	A simple debug message display.

	/// @param message

	if(_bnet_debug) show_debug_message("["+string(date_get_month(date_current_datetime()))+"/"+string(date_get_day(date_current_datetime()))+" "+string(date_get_hour(date_current_datetime()))+":"+string(date_get_minute(date_current_datetime()))+":"+string(date_get_second(date_current_datetime()))+"]" + string_lower(" BNET "+argument0));


}
