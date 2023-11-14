if (place_meeting(x + obj_player.hsp, y, obj_player) && obj_player.state == 17 && global.combomode == 0)
{
	with (obj_player)
	{
		state = states.finishingblow;
		image_index = 0;
		sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
	}
	if (obj_player.state == states.finishingblow)
	{
		sprite_index = spr_tvturnon;
		global.combomode = 1;
		with (obj_tv)
		{
			message = "NON STOP COMBO MODE ACTIVATED";
			showtext = 1;
			alarm[0] = 200;
		}
	}
}
if (place_meeting(x + obj_player.hsp, y, obj_player) && obj_player.state == 17 && global.combomode == 1)
{
	with (obj_player)
	{
		state = states.finishingblow;
		image_index = 0;
		sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
	}
	if (obj_player.state == states.finishingblow)
	{
		sprite_index = spr_tvoff;
		global.combomode = 0;
		with (obj_tv)
		{
			message = "NORMAL COMBO MODE ACTIVATED";
			showtext = 1;
			alarm[0] = 200;
		}
	}
}
