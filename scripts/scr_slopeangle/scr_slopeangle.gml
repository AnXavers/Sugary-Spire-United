function scr_slopeangle(argument0 = x, argument1 = y, argument2 = 2)
{
	if !global.slopeangle
	{
		return 0;
	}
	var array = 0;
	var checkside = -1;
	var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
	var top = -4;
	
	array[0] = y;
	array[1] = y;
	
	var _function = function()
	{
		return scr_solid(argument0, argument1) || (scr_slope_ext(argument0, argument1) && scr_slopePlatform(argument0, argument1));
	}
	for (var i = 0; i < 2; i++)
	{
		while (top < height)
		{
			array[i] = y;
			var check_1 = _function(x + (argument2 * checkside), y + top);
			var check_2 = !_function(x + (argument2 * checkside), (y + top) - 1);
			if (check_1 && check_2)
			{
				var sex = (y + top) - 1;
				array[i] = sex;
				break;
			}
			top++;
		}
		checkside = !checkside;
	}
	var pointer1 = array[0];
	var pointer2 = array[1];
	var _angle = 0;
	if (pointer1 != pointer2)
		_angle = point_direction(x - argument2, pointer1, x + argument2, pointer2);
	return _angle;
}
function scr_slopeanglenonplayer(argument0, argument1, argument2 = 1)
{
	if !global.slopeangle
	{
		return 0;
	}
	var array = 0;
	var checkside = -1;
	var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
	var top = -4;
	
	array[0] = argument1;
	array[1] = argument1;
	
	var _function = function()
	{
		return scr_solid(argument0, argument1) || (scr_slope_ext(argument0, argument1) && scr_slopePlatform(argument0, argument1));
	}
	
	for (var i = 0; i < 2; i++)
	{
		while (top < height)
		{
			array[i] = argument1;
			var check_1 = _function(argument0 + (argument2 * checkside), argument1 + top);
			var check_2 = !_function(argument0 + (argument2 * checkside), (argument1 + top) - 1);
			if (check_1 && check_2)
			{
				var sex = (argument1 + top) - 1;
				array[i] = sex;
				break;
			}
			top++;
		}
		checkside = !checkside;
	}
	var pointer1 = array[0];
	var pointer2 = array[1];
	var _angle = 0;
	if (pointer1 != pointer2)
		_angle = point_direction(argument0 - argument2, pointer1, argument0 + argument2, pointer2);
	return _angle;
}
function scr_checkSlopeAngle()
{
	return scr_checkPositionSolidAngle(x, bbox_bottom, abs(x - bbox_left), abs(x - bbox_right) - 1, (bbox_bottom - bbox_top) / 2, -90, undefined, true);
}
