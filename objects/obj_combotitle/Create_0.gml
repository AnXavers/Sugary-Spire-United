title_index = 0;
title = 0;
vsp = 0;
mvsp = 0;
blinking = false;
image_alpha = 3;
depth = -10;
image_speed = 0;
alpha = 3;
seq = 0;
type = 0;
var num = floor(global.combo / 25);
num = clamp(num, 0, 3);
type = num;
depth = obj_tv.depth - 1;
switch (type)
{
	case 0:
		image_xscale = 0;
		image_yscale = 0;
		if global.eggplantcombo
			scr_sound(sfx_combotitle1)
		break;
	case 1:
		image_xscale = 3;
		image_yscale = 0;
		if global.eggplantcombo
			scr_sound(sfx_combotitle2)
		break;
	case 2:
		image_xscale = 0;
		image_yscale = 3;
		if global.eggplantcombo
			scr_sound(sfx_combotitle3)
		break;
	default:
		image_xscale = 0;
		image_yscale = 0;
		if global.eggplantcombo
			scr_sound(sfx_combotitle3)
		break;
}
sprite_index = obj_player.spr_combotitle
if global.language == 2
	sprite_index = obj_player.spr_combotitle_BR
else if global.language == 1
	sprite_index = obj_player.spr_combotitle_ES
dotruly = floor(global.combo / 125)