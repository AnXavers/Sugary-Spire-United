/// @description Confecti Count
event = event + 1
shake1 = false
shake2 = false
shake3 = false
shake4 = false
shake5 = false
switch event
{
	case 1:
	if global.mallowfollow == 1
	mallowspr = spr_confecti1rank
	else
	mallowspr = spr_confecti1rankm
	drawmallow = true
	alarm[0] = 15
	break;
	case 2:
	if global.chocofollow == 1
	chocospr = spr_confecti2rank
	else
	chocospr = spr_confecti2rankm
	drawchoco = true
	alarm[0] = 15
	break;
	case 3:
	if global.crackfollow == 1
	crackspr = spr_confecti3rank
	else
	crackspr = spr_confecti3rankm
	drawcrack = true
	alarm[0] = 15
	alarm[0] = 15
	break;
	case 4:
	if global.wormfollow == 1
	wormspr = spr_confecti4rank
	else
	wormspr = spr_confecti4rankm
	drawworm = true
	alarm[0] = 15
	break;
	case 5:
	if global.candyfollow == 1
	candyspr = spr_confecti5rank
	else
	candyspr = spr_confecti5rankm
	drawcandy = true
	alarm[0] = 15
	break;
	default:
	alarm[1] = 50
}
