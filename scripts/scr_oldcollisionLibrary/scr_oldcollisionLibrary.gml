function scr_movingPlatforms(argument0, argument1 = true, argument2 = true) //scr_movingPlatforms
{
	with (argument0)
	{
		if argument1
			other.x += (x - xprevious)
		if argument2
			other.y += (y - yprevious)
	}
}

function scr_upslope(argument0, argument1, argument2 = 3) //scr_upslope
{
	for (var i = argument2; i > 0; i--)
	{
		var _check = 1
		var _z = (i - 1)
		repeat (i - 1)
		{
			if (!(scr_solid(argument0, (argument1 - _z))))
				_check = 0
			_z--
		}
		if (scr_solid(argument0, argument1) && _check && (!(scr_solid(argument0, (argument1 - i)))))
			return i;
	}
	return 0;
}

function scr_downslope(argument0, argument1, argument2 = 3) //scr_downslope
{
	for (i = 1; i < (argument2 + 1); i++)
	{
		_check = 1
		_z = 1
		repeat i
		{
			if scr_solid(argument0, (argument1 + _z))
				_check = 0
			_z++
		}
		if ((!(scr_solid(argument0, argument1))) && _check && scr_solid(argument0, (argument1 + (i + 1))))
			return i;
	}
	return 0;
}

function scr_collide() //scr_collide
{
	scr_collision()
}

function scr_upslope_player(argument0, argument1, argument2 = 3) //scr_upslope_player
{
	for (i = argument2; i > 0; i--)
	{
		_check = 1
		_z = (i - 1)
		repeat (i - 1)
		{
			if (!(scr_solid(argument0, (argument1 - _z))))
				_check = 0
			_z--
		}
		if (scr_solid(argument0, argument1) && _check && (!(scr_solid(argument0, (argument1 - i)))))
			return i;
	}
	return 0;
}

function scr_downslope_player(argument0, argument1, argument2 = 3) //scr_downslope_player
{
	for (i = 1; i < (argument2 + 1); i++)
	{
		_check = 1
		_z = 1
		repeat i
		{
			if scr_solid(argument0, (argument1 + _z))
				_check = 0
			_z++
		}
		if ((!(scr_solid(argument0, argument1))) && _check && scr_solid(argument0, (argument1 + (i + 1))))
			return i;
	}
	return 0;
}

function scr_collide_player() //scr_collide_player
{
	grounded = 0
	groundedSlope = 0
	grinding = 0
	onMovingPlatform = noone
	prevHsp = hsp
	prevVsp = vsp
	with (obj_movingPlatform)
	{
		with (other)
		{
			var old_y = bbox_bottom
			var other_hsp = (other.x - other.xprevious)
			var other_vsp = (other.y - other.yprevious)
			if (place_meeting((x + other_hsp), y, other.id) || (place_meeting(x, ((y + other_vsp) + 1), other.id) && old_y < other.bbox_top))
			{
				var hcheck = scr_solid((x + other_hsp), y)
				var vcheck = scr_solid(x, (y + other_vsp))
				scr_movingPlatforms(other.id, (!hcheck), (!vcheck))
				onMovingPlatform = other.id
			}
		}
	}
	repeat abs(vsp)
	{
		if (!(scr_solid(x, (y + sign(vsp)))))
			y += sign(vsp)
		else
		{
			vsp = 0
			break;
		}
	}
	repeat abs(hsp)
	{
		y -= scr_upslope_player((x + sign(hsp)), y)
		y += scr_downslope_player((x + sign(hsp)), y)
		if (!(scr_solid((x + sign(hsp)), y)))
			x += sign(hsp)
		else
		{
			hsp = 0
			break;
		}
	}
	if (vsp < 20)
		vsp += grav
	var _oldGrounded = grounded
	grounded = scr_solid(x, (y + 1))
	groundedSlope = (scr_slope_ext(x, (y + 1)) && scr_slope_ext(x, ((y - bbox_top) + bbox_bottom)))
	if ((!grounded) && _oldGrounded && instance_exists(onMovingPlatform))
	{
		hsp += (onMovingPlatform.x - onMovingPlatform.xprevious)
		vsp += (onMovingPlatform.y - onMovingPlatform.yprevious)
	}
}

function scr_collide_conehead() //scr_collide_conehead
{
	grounded = 0
	groundedSlope = 0
	onMovingPlatform = noone
	with (obj_movingPlatform)
	{
		with (other.id)
		{
			old_y = bbox_bottom
			other_hsp = (other.x - other.xprevious)
			other_vsp = (other.y - other.yprevious)
			if (place_meeting((x - other_hsp), y, other.id) || (place_meeting(x, ((y + other_vsp) + 1), other.id) && old_y < other.y))
			{
				hcheck = scr_solid((x + other_hsp), y)
				vcheck = scr_solid(x, (y + other_vsp))
				scr_movingPlatforms(other.id, (!hcheck), (!vcheck))
				onMovingPlatform = other.id
			}
		}
	}
	repeat abs(vsp)
	{
		if (!(scr_solid(x, (y + sign(vsp)))))
			y += sign(vsp)
		else
		{
			vsp = 0
			break;
		}
	}
	repeat abs(hsp)
	{
		y -= scr_upslope((x + sign(hsp)), y)
		y += scr_downslope((x + sign(hsp)), y)
		if (!(scr_solid((x + sign(hsp)), y)))
			x += sign(hsp)
	}
	if (vsp < 10)
		vsp += grav
	_oldGrounded = grounded
	grounded = scr_solid(x, (y + 1))
	groundedSlope = slopeCheck(x, y)
	if ((!grounded) && _oldGrounded && instance_exists(onMovingPlatform))
	{
		hsp += (onMovingPlatform.x - onMovingPlatform.xprevious)
		vsp += (onMovingPlatform.y - onMovingPlatform.yprevious)
	}
}
