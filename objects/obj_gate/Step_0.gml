var _values;
_values[0] = false;
var i = 0;
with (par_logicobjects)
{
	if (outputID == other.gateID)
		_values[i++] = logicOutput;
}
var _check = false;
for (i = 0; i < array_length(_values); i++)
{
	if (_values[i])
	{
		_check = true;
		break;
	}
}
if (_check)
{
	if (!reversed)
		queuedEvent = 2;
	else
		queuedEvent = 1;
}
else if (!reversed)
	queuedEvent = 1;
else
	queuedEvent = 2;
if ((currentstate == 1 || currentstate == 0) && queuedEvent != 0)
{
	if (queuedEvent == 2 && currentstate != 0)
	{
		currentstate = 2;
		nextstate = 0;
		sprite_index = spr_gateRaising;
	}
	else if (queuedEvent == 1 && currentstate != 1)
	{
		currentstate = 3;
		nextstate = 1;
		sprite_index = spr_gateLowering;
	}
	queuedEvent = 0;
}
if (currentstate == 1)
{
	with (obj_player)
	{
		if (state != states.noclip)
		{
			if (place_meeting(x, y, other))
			{
				if ((other.image_angle % 180) != 0)
				{
					var will_godown = distance_to_point(x, other.bbox_bottom) <= distance_to_point(x, other.bbox_top);
					var try_count = 0;
					while (try_count < 2)
					{
						var _targetY1 = other.bbox_bottom + (bbox_top - y) + 1;
						var _targetY2 = other.bbox_top - (y - bbox_bottom) - 1;
						var _targetY = will_godown ? _targetY1 : _targetY2;
						if (!scr_solid(x, _targetY))
						{
							y = _targetY;
							break;
						}
						else
						{
							will_godown = !will_godown;
							try_count++;
						}
					}
				}
				else
				{
					var will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y);
					try_count = 0;
					while (try_count < 2)
					{
						var _targetX1 = other.bbox_left - (bbox_right - x) - 1;
						var _targetX2 = other.bbox_right + (x - bbox_left) + 1;
						var _targetX = will_goleft ? _targetX1 : _targetX2;
						if (!scr_solid(_targetX, y))
						{
							x = _targetX;
							break;
						}
						else
						{
							will_goleft = !will_goleft;
							try_count++;
						}
					}
				}
			}
		}
	}
	with (obj_baddie)
	{
		if (state != enemystates.grabbed)
		{
			if (place_meeting(x, y, other))
			{
				if ((other.image_angle % 180) != 0)
				{
					will_godown = distance_to_point(x, other.bbox_bottom) <= distance_to_point(x, other.bbox_top);
					try_count = 0;
					while (try_count < 2)
					{
						_targetY1 = other.bbox_bottom - (bbox_top - y) - 1;
						_targetY2 = other.bbox_top + (y - bbox_bottom) + 1;
						_targetY = will_godown ? _targetY1 : _targetY2;
						if (!scr_solid(x, _targetY))
						{
							y = _targetY;
							break;
						}
						else
						{
							will_godown = !will_godown;
							try_count++;
						}
					}
				}
				else
				{
					will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y);
					try_count = 0;
					while (try_count < 2)
					{
						_targetX1 = other.bbox_left - (bbox_right - x) - 1;
						_targetX2 = other.bbox_right + (x - bbox_left) + 1;
						_targetX = will_goleft ? _targetX1 : _targetX2;
						if (!scr_solid(_targetX, y))
						{
							x = _targetX;
							break;
						}
						else
						{
							will_goleft = !will_goleft;
							try_count++;
						}
					}
				}
			}
		}
	}
}
