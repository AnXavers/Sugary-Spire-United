global.MyCollisionList = ds_list_create()
function instance_place_list_collision(argument0, argument1, argument2 = 0, argument3 = undefined) //instance_place_list_collision
{
	var collided = 0
	var check_slopes = (1 & argument2) != 1
	var check_solids = (2 & argument2) != 2
	var check_platforms = (8 & argument2) != 8
	var check_moving = (4 & argument2) != 4
	if check_solids
	{
		collided += instance_place_list_solid(argument0, argument1, argument3)
		collided += instance_place_list_slopeSolid(argument0, argument1, argument3)
	}
	if check_slopes
	{
		if check_solids
			collided += instance_place_list_slope(argument0, argument1, argument3)
		if check_platforms
			collided += instance_place_list_slopePlatform(argument0, argument1, argument3)
	}
	if check_platforms
	{
		collided += instance_place_list_platform(argument0, argument1, argument3)
		collided += instance_place_list_sidePlatform(argument0, argument1, argument3)
	}
	if check_moving
		collided += instance_place_list_movingPlatform(argument0, argument1, argument3)
	return collided;
}

function place_meeting_collision(argument0, argument1, argument2 = 0) //place_meeting_collision
{
	var check_slopes = (1 & argument2) != 1
	var check_solids = (2 & argument2) != 2
	var check_platforms = (8 & argument2) != 8
	var check_moving = (4 & argument2) != 4
	if check_solids
	{
		if place_meeting_solid(argument0, argument1)
			return 1;
		if place_meeting_slopeSolid(argument0, argument1)
			return 1;
	}
	if check_slopes
	{
		if check_solids
		{
			if place_meeting_slope(argument0, argument1, 0)
				return 1;
		}
		if check_platforms
		{
			if place_meeting_slopePlatform(argument0, argument1)
				return 1;
		}
	}
	if check_platforms
	{
		if place_meeting_platform(argument0, argument1)
			return 1;
		if place_meeting_sidePlatform(argument0, argument1)
			return 1;
	}
	if check_moving
	{
		if place_meeting_movingPlatform(argument0, argument1)
			return 1;
	}
	return 0;
}

function position_meeting_collision(argument0, argument1, argument2 = 0) //position_meeting_collision
{
	var old_mask = mask_index
	mask_index = spr_pixel
	var check_collision = place_meeting_collision(argument0, argument1, argument2)
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_solid(argument0, argument1, argument2 = obj_solid, argument3 = undefined) //instance_place_list_solid
{
	if place_meeting(argument0, argument1, argument2)
	{
		var solid_number = instance_place_list(argument0, argument1, argument2, global.MyCollisionList, 0)
		var collided = 0
		if (solid_number > 0)
		{
			for(var i = 0; i < solid_number; i++)
			{
				var solid_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(solid_object, "canCollide")
					_can_collide = solid_object.canCollide(object_index)
				if (_can_collide == 1)
				{
					collided++
					if (!is_undefined(argument3))
						ds_list_add(argument3, solid_object.id)
					else
						break
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
			return collided;
	}
	return 0;
}

function place_meeting_solid(argument0, argument1, argument2 = obj_solid) //place_meeting_solid
{
	return instance_place_list_solid(argument0, argument1, argument2) > 0;
}

function position_meeting_solid(argument0, argument1, argument2 = obj_solid) //position_meeting_solid
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_solid(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_platform(argument0, argument1, argument2 = obj_platform, argument3 = undefined) //instance_place_list_platform
{
	collided = 0
	if place_meeting(argument0, argument1, argument2)
	{
		var platform_number = instance_place_list(argument0, argument1, argument2, global.MyCollisionList, 0)
		if (platform_number > 0)
		{
			for(var i = 0; i < platform_number; i++)
			{
				var platform_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(platform_object, "canCollide")
					_can_collide = platform_object.canCollide(object_index)
				var _check = (sign(platform_object.image_yscale) <= -1 ? argument1 <= y : argument1 > y)
				if (_check == 1 && _can_collide && place_meeting(argument0, argument1, platform_object) && (!(place_meeting(argument0, y, platform_object))))
				{
					collided++
					if (!is_undefined(argument3))
						ds_list_add(argument3, platform_object.id)
					else
						break
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
			return collided;
	}
	return 0;
}

function instance_place_list_sidePlatform(argument0, argument1, argument2 = obj_sidePlatform, argument3 = undefined) //instance_place_list_sidePlatform
{
	var collided = 0
	if place_meeting(argument0, argument1, argument2)
	{
		var side_platform_number = instance_place_list(argument0, argument1, argument2, global.MyCollisionList, 0)
		if (side_platform_number > 0)
		{
			for(var i = 0; i < side_platform_number; i++)
			{
				var side_platform_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(side_platform_object, "canCollide")
					_can_collide = side_platform_object.canCollide(object_index)
				_check = (sign(side_platform_object.image_xscale) < 0 ? argument0 >= x : argument0 <= x)
				if (_check == 1 && _can_collide && place_meeting(argument0, argument1, side_platform_object) && (!(place_meeting(x, argument1, side_platform_object))))
				{
					collided++
					if (!is_undefined(argument3))
						ds_list_add(argument3, side_platform_object.id)
					else
						break
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
			return collided;
	}
	return 0;
}

function place_meeting_platform(argument0, argument1, argument2 = obj_platform) //place_meeting_platform
{
	return instance_place_list_platform(argument0, argument1, argument2) > 0;
}

function position_meeting_platform(argument0, argument1, argument2 = obj_platform) //position_meeting_platform
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_platform(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}

function place_meeting_sidePlatform(argument0, argument1, argument2 = obj_sidePlatform) //place_meeting_sidePlatform
{
	return instance_place_list_sidePlatform(argument0, argument1, argument2) > 0;
}

function position_meeting_sidePlatform(argument0, argument1, argument2 = obj_sidePlatform) //position_meeting_sidePlatform
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_sidePlatform(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_movingPlatform(argument0, argument1, argument2 = obj_movingPlatform, argument3 = undefined) //instance_place_list_movingPlatform
{
	collided = 0
	if place_meeting(argument0, argument1, argument2)
	{
		var movingplatform_number = instance_place_list(argument0, argument1, argument2, global.MyCollisionList, 0)
		if (movingplatform_number > 0)
		{
			for(var i = 0; i < movingplatform_number; i++)
			{
				var movingplatform_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(movingplatform_object, "canCollide")
					_can_collide = movingplatform_object.canCollide(object_index)
				_check = (sign(movingplatform_object.image_yscale) <= -1 ? argument1 <= y : argument1 > y)
				if (_check == 1 && _can_collide && place_meeting(argument0, argument1, movingplatform_object) && (!(place_meeting(argument0, y, movingplatform_object))))
				{
					collided++
					if (!is_undefined(argument3))
						ds_list_add(argument3, movingplatform_object.id)
					else
						break
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
			return collided;
	}
	return 0;
}

function place_meeting_movingPlatform(argument0, argument1, argument2 = obj_movingPlatform) //place_meeting_movingPlatform
{
	return instance_place_list_movingPlatform(argument0, argument1, argument2) > 0;
}
function position_meeting_movingPlatform(argument0, argument1, argument2 = obj_movingPlatform) //position_meeting_movingPlatform
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_movingPlatform(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_slopePlatform(argument0, argument1, argument2 = obj_slopePlatform, argument3 = undefined) //instance_place_list_slopePlatform
{
	var old_x = x
	var old_y = y
	var old_bbox_top = bbox_top
	var old_bbox_bottom = bbox_bottom
	x = argument0
	y = argument1
	collided = 0
	if place_meeting(x, y, argument2)
	{
		var slopeplatform_number = instance_place_list(x, y, argument2, global.MyCollisionList, 0)
		if (slopeplatform_number > 0)
		{
			for(var i = 0; i < slopeplatform_number; i++)
			{
				var slopeplatform_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(slopeplatform_object, "canCollide")
					_can_collide = slopeplatform_object.canCollide(object_index)
				if _can_collide
				{
					var object_side = (slopeplatform_object.image_xscale > 0 ? bbox_right : bbox_left)
					object_side = ((object_side - x) + old_x)
					var player_pos = point_direction((slopeplatform_object.x + slopeplatform_object.sprite_width), (slopeplatform_object.y + slopeplatform_object.sprite_height), x, y)
					if (slopeplatform_object.image_yscale > 0)
						var _check1 = (slopeplatform_object.image_xscale > 0 ? (player_pos <= 180 && player_pos >= 90) : (player_pos <= 90 && player_pos >= 0))
					else
						_check1 = (slopeplatform_object.image_xscale > 0 ? (player_pos <= 270 && player_pos >= 180) : ((player_pos <= 360 || player_pos <= 0) && player_pos >= 270))
					var _check2 = (!(triangle_meeting(old_x, old_y, slopeplatform_object.x, (slopeplatform_object.y + slopeplatform_object.sprite_height), (slopeplatform_object.x + slopeplatform_object.sprite_width), slopeplatform_object.y, (slopeplatform_object.x + slopeplatform_object.sprite_width), (slopeplatform_object.y + slopeplatform_object.sprite_height))))
					var _check3 = (slopeplatform_object.image_xscale > 0 ? object_side <= slopeplatform_object.bbox_left : object_side >= slopeplatform_object.bbox_right)
					if (_check1 && (_check2 || _check3) && (slopeplatform_object.image_yscale > 0 ? old_bbox_bottom <= slopeplatform_object.bbox_bottom : old_bbox_top >= slopeplatform_object.bbox_top) && triangle_meeting(x, y, slopeplatform_object.x, (slopeplatform_object.y + slopeplatform_object.sprite_height), (slopeplatform_object.x + slopeplatform_object.sprite_width), slopeplatform_object.y, (slopeplatform_object.x + slopeplatform_object.sprite_width), (slopeplatform_object.y + slopeplatform_object.sprite_height)))
					{
						collided++
						if (!is_undefined(argument3))
							ds_list_add(argument3, slopeplatform_object.id)
						else
							break
					}
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
		{
			x = old_x
			y = old_y
			return collided;
		}
	}
	x = old_x
	y = old_y
	return 0;
}

function place_meeting_slopePlatform(argument0, argument1, argument2 = obj_slopePlatform) //place_meeting_slopePlatform
{
	return instance_place_list_slopePlatform(argument0, argument1, argument2) > 0;
}

function position_meeting_slopePlatform(argument0, argument1, argument2 = obj_slopePlatform) //position_meeting_slopePlatform
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_slopePlatform(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_slope(argument0, argument1, argument2 = obj_slope, argument3 = undefined) //instance_place_list_slope
{
	if place_meeting(argument0, argument1, argument2)
	{
		var slope_number = instance_place_list(argument0, argument1, argument2, global.MyCollisionList, 0)
		var collided = 0
		if (slope_number > 0)
		{
			for(var i = 0; i < slope_number; i++)
			{
				var slope_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(slope_object, "canCollide")
					_can_collide = slope_object.canCollide(object_index)
				if (_can_collide == 1 && triangle_meeting(argument0, argument1, slope_object.x, (slope_object.y + slope_object.sprite_height), (slope_object.x + slope_object.sprite_width), slope_object.y, (slope_object.x + slope_object.sprite_width), (slope_object.y + slope_object.sprite_height)))
				{
					collided++
					if (!is_undefined(argument3))
						ds_list_add(argument3, slope_object.id)
					else
						break
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
			return collided;
	}
	return 0;
}

function place_meeting_slope(argument0, argument1, argument2 = obj_minedummycart, argument3 = obj_slope) //place_meeting_slope
{
	_check2 = (argument2 ? place_meeting_slopePlatform(argument0, argument1) : 0)
	return (instance_place_list_slope(argument0, argument1, argument3) > 0 || _check2);
}

function position_meeting_slope(argument0, argument1, argument2 = obj_slope) //position_meeting_slope
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_slope(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}

function instance_place_list_slopeSolid(argument0, argument1, argument2 = obj_slope, argument3 = undefined) //instance_place_list_slopeSolid
{
	if place_meeting(argument0, argument1, argument2)
	{
		var slope_number = instance_place_list(argument0, argument1, argument2, global.MyCollisionList, 0)
		var collided = 0
		if (slope_number > 0)
		{
			for(var i = 0; i < slope_number; i++)
			{
				var slope_object = ds_list_find_value(global.MyCollisionList, i)
				var _can_collide = 1
				if variable_instance_exists(slope_object, "canCollide")
					_can_collide = slope_object.canCollide(object_index)
				var _xscale = (argument0 - x)
				var _check1 = (sign(slope_object.image_xscale) != _xscale && _xscale != 0)
				var _check2 = (slope_object.image_yscale < 0 ? bbox_bottom <= slope_object.bbox_top : bbox_top >= slope_object.bbox_bottom)
				if (_can_collide == 1 && (_check1 || _check2) && triangle_meeting(argument0, argument1, slope_object.x, (slope_object.y + slope_object.sprite_height), (slope_object.x + slope_object.sprite_width), slope_object.y, (slope_object.x + slope_object.sprite_width), (slope_object.y + slope_object.sprite_height)))
				{
					collided++
					if (!is_undefined(argument3))
						ds_list_add(argument3, slope_object.id)
					else
						break
				}
			}
		}
		ds_list_clear(global.MyCollisionList)
		if (collided > 0)
			return collided;
	}
	return 0;
}

function place_meeting_slopeSolid(argument0, argument1, argument2 = obj_slope) //place_meeting_slopeSolid
{
	return instance_place_list_slopeSolid(argument0, argument1, argument2) > 0;
}

function position_meeting_slopeSolid(argument0, argument1, argument2 = obj_slope) //position_meeting_slopeSolid
{
	old_mask = mask_index
	mask_index = spr_pixel
	check_collision = instance_place_list_slopeSolid(argument0, argument1, argument2) > 0
	mask_index = old_mask
	return check_collision;
}
