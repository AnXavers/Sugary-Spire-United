if (aggro == 1)
	aggro = 2
if (aggro == 2)
	return;
var hit = 0
switch other.state
{
    case (4 << 0):
    case (5 << 0):
    case (6 << 0):
    case (7 << 0):
    case (8 << 0):
    case (13 << 0):
    case (17 << 0):
    case (19 << 0):
    case (20 << 0):
    case (21 << 0):
    case (23 << 0):
    case (24 << 0):
    case (28 << 0):
    case (36 << 0):
    case (37 << 0):
    case (39 << 0):
    case (40 << 0):
    case (41 << 0):
    case (42 << 0):
    case (43 << 0):
    case (53 << 0):
    case (57 << 0):
    case (63 << 0):
    case (70 << 0):
    case (71 << 0):
    case (74 << 0):
    case (81 << 0):
    case (86 << 0):
    case (89 << 0):
    case (93 << 0):
    case (96 << 0):
    case (97 << 0):
    case (98 << 0):
	case (99 << 0):
	case (101 << 0):
	case (108 << 0):
	case (103 << 0):
	case (104 << 0):
	case (105 << 0):
	case (106 << 0):
	case (107 << 0):
	case (120 << 0):
	case (121 << 0):
	case (130 << 0):
	case (133 << 0):
	case (154 << 0):
		hit = 1
		break
	default:
		hit = 0
		break
}

if (hit == 1)
{
	repeat (3)
		instance_create(x, y, obj_slapstar)
	x = (room_width / 2)
	y = -60
	if (room == molasses_9)
		y = -1600
}
else
	scr_hurtplayer(other)
