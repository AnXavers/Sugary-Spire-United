function scr_collision_init() //scr_collision_init
{
	usesCollision = 1
	grounded = 0
	groundedSlope = 0
	terminalVelocity = 10
	onMovingPlatform = noone
	grav = 0
	hsp = 0
	vsp = 0
	prevHsp = 0
	prevVsp = 0
	hspCarry = 0
	vspCarry = 0
	true_hsp = 0
	true_vsp = 0
}

function scr_collision() //scr_collision
{
	var _old_grounded = grounded
	
	grounded = false;
	groundedSlope = false;
	onMovingPlatform = noone;
	
	#region // Moving Platforms
	with (obj_movingPlatform)
	{
		var _hspeed = (x - xprevious)
		var _vspeed = (y - yprevious)
		with (other.id)
		{
			x += _hspeed
			y += _vspeed
			if (place_meeting_collision(x, (y + 1), (-5 << 0)) && place_meeting(x, (y + 1), other))
				onMovingPlatform = other.id
			x -= _hspeed
			y -= _vspeed
		}
	}
	if instance_exists(onMovingPlatform)
		kinematics_movingPlatforms(id, onMovingPlatform, 1)
	#endregion
	
	// Subpixel Fix
	true_hsp = hsp
	true_vsp = vsp
	hsp = ((hsp + hspCarry) > 0 ? floor((hsp + hspCarry)) : ceil((hsp + hspCarry)))
	vsp = ((vsp + vspCarry) > 0 ? floor((vsp + vspCarry)) : ceil((vsp + vspCarry)))
	
	// Horizontal
	var move_hsp = clamp(abs(hsp), 0, (bbox_right - bbox_left)) * sign(hsp) // Calculate max units to move.
	repeat ceil(abs(hsp) / (bbox_right - bbox_left))
	{
		if ((!(place_meeting_collision((x + move_hsp), y))) && (!((place_meeting_collision(x, (y + 1)) && (!(place_meeting_collision((x + move_hsp), (y + 1))))))))
			x += move_hsp
		else
		{
			repeat abs(move_hsp)
			{
				y -= slope_check_up((x + sign(move_hsp)), y)
				y += slope_check_down((x + sign(move_hsp)), y)
				y += reverseSlope_check_down((x + sign(move_hsp)), y)
				if (vsp <= 0 && place_meeting_collision(x, (y - 1)))
					y -= reverseSlope_check_up((x + sign(move_hsp)), y)
					
				if (!(place_meeting_collision((x + sign(move_hsp)), y)))
					x += sign(move_hsp)
				else
				{
					true_hsp = 0
					move_hsp = 0
					hsp = 0
					break;
				}
			}
		}
	}
	
	var move_vsp = clamp(abs(vsp), 0, (bbox_bottom - bbox_top)) * sign(vsp)
	repeat ceil((abs(vsp) / (bbox_bottom - bbox_top)))
	{
		if (!(place_meeting_collision(x, (y + move_vsp))))
			y += move_vsp
		else
		{
			repeat abs(move_vsp)
			{
				if (vsp < 0)
				{
					x -= slope_check_left(x, (y + sign(vsp)))
					x += slope_check_right(x, (y + sign(vsp)))
				}
				
				if (!(place_meeting_collision(x, (y + sign(move_vsp)))))
					y += sign(move_vsp)
				else
				{
					true_vsp = 0
					move_vsp = 0
					vsp = 0
					break;
				}
			}
		}
	}
	
	hsp = true_hsp
	vsp = true_vsp
	hspCarry = 0
	vspCarry = 0
	if (vsp < terminalVelocity)
		vsp += grav
	grounded = place_meeting_collision(x, (y + 1))
	groundedSlope = place_meeting_slope(x, (y + 1))
	if ((!grounded) && _old_grounded && instance_exists(onMovingPlatform))
	{
		hspCarry = ((onMovingPlatform.x - onMovingPlatform.xprevious) / 2)
		vspCarry = ((onMovingPlatform.y - onMovingPlatform.yprevious) / 2)
	}
	prevHsp = hsp
	prevVsp = vsp
}

function kinematics_movingPlatforms(argument0, argument1, argument2 = true) //kinematics_movingPlatforms
{
	with (argument1)
	{
		var _hsp = round((x - xprevious))
		var _vsp = round((y - yprevious))
		if (!argument2)
		{
			with (argument0)
			{
				x += _hsp
				y += _vsp
			}
		}
		else
		{
			with (argument0)
			{
				repeat abs(_hsp)
				{
					if (!(place_meeting_collision((x + sign(_hsp)), y)))
						x += sign(_hsp)
					else
					{
						_hsp = 0
						break;
					}
				}
				repeat abs(_vsp)
				{
					if (!(place_meeting_collision(x, (y + sign(_vsp)))))
						y += sign(_vsp)
					else
					{
						_vsp = 0
						break;
					}
				}
			}
		}
	}
}

function slope_check_up(argument0, argument1, argument2 = 3) //slope_check_up
{
	for (var i = argument2; i > 0; i--)
	{
		var _check = 1
		var _z = (i - 1)
		repeat (i - 1)
		{
			if (!(place_meeting_collision(argument0, (argument1 - _z))))
				_check = 0
			_z--
		}
		if (place_meeting_collision(argument0, argument1) && _check && (!(place_meeting_collision(argument0, (argument1 - i)))))
			return i;
	}
	return 0;
}

function slope_check_down(argument0, argument1, argument2 = 3) //slope_check_down
{
	for (i = 1; i < (argument2 + 1); i++)
	{
		_check = 1
		_z = 1
		repeat i
		{
			if place_meeting_collision(argument0, (argument1 + _z))
				_check = 0
			_z++
		}
		if ((!(place_meeting_collision(argument0, argument1))) && _check && place_meeting_collision(argument0, (argument1 + (i + 1))))
			return i;
	}
	return 0;
}

function slope_check_left(argument0, argument1, argument2 = 3) //slope_check_left
{
	for (i = 0; i < argument2; i++)
	{
		if (place_meeting_collision(argument0, argument1) && (!(place_meeting_collision((argument0 - i), argument1))))
			return i;
	}
	return 0;
}

function slope_check_right(argument0, argument1, argument2 = 3) //slope_check_right
{
	for (i = 0; i < argument2; i++)
	{
		if (place_meeting_collision(argument0, argument1) && (!(place_meeting_collision((argument0 + i), argument1))))
			return i;
	}
	return 0;
}

function reverseSlope_check_down(argument0, argument1, argument2 = 3) //reverseSlope_check_down
{
	for (i = 0; i < argument2; i++)
	{
		if (place_meeting_collision(argument0, argument1) && (!(place_meeting_collision(argument0, (argument1 + i)))))
			return i;
	}
	return 0;
}

function reverseSlope_check_up(argument0, argument1, argument2 = 3) //reverseSlope_check_up
{
	for (i = 0; i < argument2; i++)
	{
		if ((!(place_meeting_collision(argument0, argument1))) && (!(place_meeting_collision(argument0, (argument1 - i)))) && place_meeting_collision(argument0, (argument1 - (i + 1))))
			return i;
	}
	return 0;
}

