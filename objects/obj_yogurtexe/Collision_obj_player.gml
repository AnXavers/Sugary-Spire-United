if (aggro == 1)
	aggro = 2
if (aggro == 2)
	return;
var hit = 0
switch other.state
{
	case states.slap:
	case states.charge:
	case states.cheesepep:
	case states.cheeseball:
	case states.cheesepepstick:
	case states.knightpepslopes:
	case states.handstandjump:
	case states.knightpep:
	case states.knightpepattack:
	case states.meteorpep:
	case states.grabbing:
	case states.chainsawpogo:
	case states.chainsaw:
	case states.superslam:
	case states.slam:
	case states.grind:
	case states.grab:
	case states.punch:
	case states.backkick:
	case states.uppunch:
	case states.freefallprep:
	case states.tackle:
	case states.Sjump:
	case states.mach3:
	case states.machslide:
	case states.freefall:
	case states.pepperman_pinball:
	case states.current:
	case states.uppercut:
	case states.parry:
	case states.tumble:
	case states.cottondrill:
	case states.cottonroll:
	case states.fling:
	case states.minecart:
	case states.machtumble:
	case states.pizzano_rocketfist:
	case states.pizzano_mach:
	case states.pizzano_kungfu:
	case states.pizzano_pummel:
	case states.fireass:
	case states.pizzano_machtwirl:
	case states.pizzano_shoulderbash:
	case states.costumegrab:
	case states.bottlerocket:
	case states.supergrab:
	case states.shoulder:
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
