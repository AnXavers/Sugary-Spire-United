function approach(val, a, b)
{
	return val + clamp(a - val, -b, b);
}
function instance_random(object)
{
	return instance_find(object, irandom(instance_number(object) - 1));
}
function trace()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	show_debug_message(_string);
	exit;
}
function get_panic()
{
	return global.panic && (!global.secret_room || (instance_exists(obj_tv) && obj_tv.sucroseTimer));
}
function chance(dec)
{
	return dec > random(1);
}
function wave(from, to, duration, offset, time = current_time)
{
	var a4 = (to - from) * 0.5;
	return from + a4 + (sin((((time * 0.001) + (duration * offset)) / duration) * (pi * 2)) * a4);
}
function loop(argument0, argument1, argument2, argument3 = 0, argument4 = current_time / 1000)
{
	var _a = ((argument4 + argument3) % argument2) / argument2;
	if (_a == 1)
		_a = 0;
	return lerp(argument0, argument1, _a);
}
function wrap(argument0, argument1, argument2)
{
	var value = floor(argument0);
	var _min = floor(min(argument1, argument2));
	var _max = floor(max(argument1, argument2));
	var range = (_max - _min) + 1;
	return ((((value - _min) % range) + range) % range) + _min;
}
function animation_end(argument0 = floor(image_index), argument1 = image_number - 1)
{
	return argument0 >= argument1;
}
function rank_checker(rank = global.rank)
{
	var value = 0;
	switch (rank)
	{
		case "e":
			value = 6;
			break;
		case "p":
			value = 5;
			break;
		case "s":
			value = 4;
			break;
		case "a":
			value = 3;
			break;
		case "b":
			value = 2;
			break;
		case "c":
			value = 1;
			break;
		case "d":
			value = 0;
			break;
		default:
			value = -1;
			break;
	}
	return value;
}
function string_extract(argument0, argument1, argument2)
{
	var len = string_length(argument1) - 1;
	repeat (argument2)
		argument0 = string_delete(argument0, 1, (string_pos(argument1, argument0) + len));
	argument0 = string_delete(argument0, string_pos(argument1, argument0), string_length(argument0));
	return argument0;
}
function create_small_number(x, y, num, col = c_black)
{
	var _smallnumber = instance_create(x, y, obj_smallnumber);
	with (_smallnumber)
	{
		number = string(num);
		color = col;
	}
	return _smallnumber;
}
function string_get_split(argument0, argument1)
{
	var slot = 0;
	var splits = [];
	var str2 = "";
	for (var i = 1; i < (string_length(argument0) + 1); i++)
	{
		var currStr = string_char_at(argument0, i);
		if (currStr == argument1)
		{
			if (str2 != "")
			{
				splits[slot] = str2;
				slot++;
			}
			str2 = "";
		}
		else
		{
			str2 = str2 + currStr;
			splits[slot] = str2;
		}
	}
	if (str2 == "")
		splits[slot] = str2;
	return splits;
}
function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
{
	gpu_set_fog(true, argument7, 0, 1);
	draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
	gpu_set_fog(false, c_black, 0, 0);
	exit;
}
function draw_self_flash(argument0)
{
	gpu_set_fog(true, argument0, 0, 1);
	draw_self();
	gpu_set_fog(false, c_black, 0, 0);
	exit;
}
function string_contains(argument0, argument1)
{
	if (string_length(argument1) > string_length(argument0))
		return false;
	return string_pos(argument1, argument0) != 0;
}
function string_startswith(argument0, argument1)
{
	if (string_length(argument1) > string_length(argument0))
		return false;
	return string_pos(argument1, argument0) == 1;
}
function string_endswith(argument0, argument1)
{
	if (string_length(argument1) > string_length(argument0))
		return false;
	return string_pos(argument1, argument0) == ((string_length(argument0) - string_length(argument1)) + 1);
}

function time_in_frames(argument0, argument1)
{
	return ((argument0 * 60) + argument1) * 60;
}
function frames_in_seconds(argument0)
{
	return floor(argument0 / room_speed)
}
function frames_in_minutes(argument0)
{
	return floor(argument0 / (room_speed * 60))
}
function onBeat(argument0, argument1 = false)
{
	var bps = argument0 / 60;
	var spb = 1 / bps;
	var songTimer = audio_sound_get_track_position(global.music);
	var _fps = 60;
	var beat2 = floor(songTimer) / (spb * _fps);
	if (beat != beat2)
	{
		beat = beat2;
		return true;
	}
	show_debug_message(beat2);
	show_debug_message(beat);
	return false;
}
function solid_in_line(argument0, argument1 = noone, argument2 = self)
{
	var _list = ds_list_create();
	var set_list = collision_line_list(x, y, argument0.x, argument0.y, par_collision, true, true, _list, true);
	if (set_list > 0)
	{
		for (var i = 0; i < set_list; i++)
		{
			var obj = ds_list_find_value(_list, i);
			show_debug_message(obj.object_index);
			if (argument1 != -4)
			{
				for (var b = 0; b < array_length(argument1); b++)
				{
					var arr = argument1[b];
					show_debug_message(arr);
					if (obj.object_index == arr)
						found_obj = true;
				}
				if (!found_obj)
				{
					ds_list_destroy(_list);
					return true;
				}
			}
			else
			{
				ds_list_destroy(_list);
				return true;
			}
		}
	}
	ds_list_destroy(_list);
	return false;
}
function angle_rotate(argument0, argument1, argument2)
{
	var diff = wrap(argument1 - argument0, -180, 180);
	if (diff < -argument2)
		return argument0 - argument2;
	if (diff > argument2)
		return argument0 + argument2;
	return argument1;
}
function gate_createlayer(argument0, argument1, argument2 = 0, argument3 = 0, argument4 = 0)
{
	return 
	{
		drawSpr: argument0,
		drawIndex: argument1,
		drawXscale: 1,
		drawYscale: 1,
		drawImgSpd: argument4,
		drawAlpha: 1,
		drawBlend: c_white,
		drawRot: 0,
		drawx: 0,
		drawy: 0,
		scroll_x: argument2,
		scroll_y: argument3,
		func: -4
	};
}
function string_random(str, count)
{
	var out = "";
	var len = string_length(str);
	if (len > 0) {
		repeat (count) {
			out += string_char_at(str, floor(random(len)) + 1);
		}
	} else {
		repeat (count) {
			out += chr(floor(random(95)) + 32);
		}
	}
	return out;
}
function VarRef(_inst, _varname) constructor {
	inst = _inst;
	varname = _varname;
	static get = function() {
		return variable_struct_get(inst, varname);
	}
	static set = function(_value) {
		variable_struct_set(inst, varname, _value);
	}
}