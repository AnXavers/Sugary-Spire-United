function scr_slope(argument0 = false)
{
	return scr_slope_ext(x, y + 1, argument0);
}
function scr_slope_ext(argument0, argument1, argument2 = false)
{
	return place_meeting_slope(argument0, argument1, !argument2);
}
function scr_solid_slope(argument0, argument1)
{
	place_meeting_slopeSolid(argument0, argument1);
}
function slopeCheck(argument0, argument1)
{
	return scr_slope_ext(argument0, argument1 + 1) && !scr_solid_slope(argument0, argument1 + 1) && !scr_solid_slope(argument0, argument1) && scr_slope_ext(argument0, (argument1 - bbox_top) + bbox_bottom);
}
function scr_slopePlatform(argument0, argument1)
{
	place_meeting_slopePlatform(argument0, argument1);
}
function slopeMomentum_acceleration()
{
	if (place_meeting_slope(x, y + 1, false))
	{
		with (instance_place(x, y + 1, obj_slope))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (sign(image_xscale) >= 1)
			{
				return -slope_acceleration;
			}
			else
			{
				return slope_acceleration;
			}
		}
	}
	if (place_meeting_slopePlatform(x, y + 1))
	{
		with (instance_place(x, y + 1, obj_slopePlatform))
		{
			slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (sign(image_xscale) >= 1)
			{
				return -slope_acceleration;
			}
			else
			{
				return slope_acceleration;
			}
		}
	}
}
function slopeMomentum_direction()
{
	if (place_meeting_slope(x, y + 1, false))
	{
		with (instance_place(x, y + 1, obj_slope))
		{
			return sign(image_xscale);
		}
	}
	if (place_meeting_slopePlatform(x, y + 1))
	{
		with (instance_place(x, y + 1, obj_slopePlatform))
		{
			return sign(image_xscale);
		}
	}
}
function player_slopeMomentum(argument0, argument1 = argument0)
{
	var inst = instance_place(x, y + 1, obj_slopePlatform);
	if (instance_place(x, y + 1, obj_slope) != -4)
		inst = instance_place(x, y + 1, obj_slope);
	if (groundedSlope && inst != -4)
	{
		var _xscale = sign(inst.image_xscale);
		var slope_acceleration = abs(inst.image_yscale) / abs(inst.image_xscale);
		if (sign(image_xscale) == _xscale)
			movespeed -= (argument1 * slope_acceleration);
		else
			movespeed += (argument0 * slope_acceleration);
	}
}
