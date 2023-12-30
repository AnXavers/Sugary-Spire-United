flags.do_once = false;
flags.do_save = false;
condition = function()
{
	var _player_y = obj_player.y + 50
	var _player_x = obj_player.x
	return (place_meeting(_player_x, _player_y, inst_40262CC0) || place_meeting(_player_x, _player_y - obj_player.xscale, inst_6D8E74D9) || place_meeting(_player_x, _player_y, inst_1DEC7218))
};
output = function()
{
	var _wave_x_prev = wave(-4, 4, 4, 0, current_time - (1000 / room_speed))
	var _wave_x = wave(-4, 4, 4, 0)
	var _x_change = _wave_x - _wave_x_prev
	obj_player.x += _x_change
};
