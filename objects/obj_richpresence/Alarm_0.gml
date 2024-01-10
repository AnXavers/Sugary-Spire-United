var _icon = "unknown_richpresence"
switch room
{
	case finale_portal:
	case hub_hallway:
	case hub_w1:
	case hub_w1old:
	case hub_w1oldold:
	case hub_w1oldoldold:
		_icon = "hub1_richpresence"
		break;
	case hub_w2:
	case hub_w2old:
		_icon = "hub2_richpresence"
		break;
}
switch global.levelname
{
	case "entryway":
		_icon = "entryway_richpresence"
		break;
	case "steamy":
		_icon = "steamy_richpresence"
		break;
	case "molasses":
		_icon = "steamy_molasses"
		break;
	case "mines":
		_icon = "mines_richpresence"
		break;
	case "fudge":
		_icon = "fudge_richpresence"
		break;
	case "danceoff":
		_icon = "dance_richpresence"
		break;
	case "estate":
		_icon = "cafe_richpresence"
		break;
	case "sucrose":
		_icon = "sucrose_richpresence"
		break;
}
if global.panic
	_icon = "escape" + _icon
np_setpresence(string(global.collect) + " Points", window_get_caption(), _icon, "")
alarm[0] = (room_speed * 5)