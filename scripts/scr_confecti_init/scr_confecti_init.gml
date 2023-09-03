function scr_confecti_init()
{
	ds_list_add(global.FollowerList, id);
	switch (object_index)
	{
		default:
			spr_idle = obj_player.spr_confecti1_idle;
			spr_run = obj_player.spr_confecti1_walk;
			spr_runpanic = obj_player.spr_confecti1_panicWalk;
			spr_panic = obj_player.spr_confecti1_panic;
			spr_appear = obj_player.spr_confecti1_appear;
			spr_taunt = obj_player.spr_confecti1_taunt;
			global.mallowfollow = true;
			if obj_player.character == "N"
				scr_queue_tvanim(spr_pizzanotv_confecti1, 100);
			else
				scr_queue_tvanim(spr_pizzytv_confecti1, 100);
			break;
		case obj_confectichoco:
			spr_idle = obj_player.spr_confecti2_idle;
			spr_run = obj_player.spr_confecti2_walk;
			spr_runpanic = obj_player.spr_confecti2_panicWalk;
			spr_panic = obj_player.spr_confecti2_panic;
			spr_appear = obj_player.spr_confecti2_appear;
			spr_taunt = obj_player.spr_confecti2_taunt;
			global.chocofollow = true;
			if obj_player.character == "N"
				scr_queue_tvanim(spr_pizzanotv_confecti2, 100);
			else
				scr_queue_tvanim(spr_pizzytv_confecti2, 100);
			break;
		case obj_confecticrack:
			spr_idle = obj_player.spr_confecti3_idle;
			spr_run = obj_player.spr_confecti3_walk;
			spr_runpanic = obj_player.spr_confecti3_panicWalk;
			spr_panic = obj_player.spr_confecti3_panic;
			spr_appear = obj_player.spr_confecti3_appear;
			spr_taunt = obj_player.spr_confecti3_taunt;
			global.crackfollow = true;
			if obj_player.character == "N"
				scr_queue_tvanim(spr_pizzanotv_confecti3, 100);
			else
				scr_queue_tvanim(spr_pizzytv_confecti3, 100);
			break;
		case obj_confectiworm:
			spr_idle = obj_player.spr_confecti4_idle;
			spr_run = obj_player.spr_confecti4_walk;
			spr_runpanic = obj_player.spr_confecti4_panicWalk;
			spr_panic = obj_player.spr_confecti4_panic;
			spr_appear = obj_player.spr_confecti4_appear;
			spr_taunt = obj_player.spr_confecti4_taunt;
			global.wormfollow = true;
			if obj_player.character == "N"
				scr_queue_tvanim(spr_pizzanotv_confecti4, 100);
			else
				scr_queue_tvanim(spr_pizzytv_confecti4, 100);
			break;
		case obj_confecticandy:
			spr_idle = obj_player.spr_confecti5_idle;
			spr_run = obj_player.spr_confecti5_walk;
			spr_runpanic = obj_player.spr_confecti5_panicWalk;
			spr_panic = obj_player.spr_confecti5_panic;
			spr_appear = obj_player.spr_confecti5_appear;
			spr_taunt = obj_player.spr_confecti5_taunt;
			global.candyfollow = true;
			if obj_player.character == "N"
				scr_queue_tvanim(spr_pizzanotv_confecti5, 100);
			else
				scr_queue_tvanim(spr_pizzytv_confecti5, 100);
			break;
		case obj_rudejanitor:
			spr_idle = obj_player.spr_janitor_idle;
			spr_run = obj_player.spr_janitor_walk;
			spr_runpanic = obj_player.spr_janitor_panicWalk;
			spr_panic = obj_player.spr_janitor_panic;
			spr_appear = obj_player.spr_janitor_appear;
			spr_taunt = obj_player.spr_janitor_taunt;
			global.janitorRudefollow = true;
			break;
		case obj_lapjanitor:
			spr_idle = obj_player.spr_lapjanitor_idle;
			spr_run = obj_player.spr_lapjanitor_walk;
			spr_runpanic = obj_player.spr_lapjanitor_panicWalk;
			spr_panic = obj_player.spr_lapjanitor_panic;
			spr_appear = obj_player.spr_lapjanitor_appear;
			spr_taunt = obj_player.spr_lapjanitor_taunt;
			global.janitorLapfollow = true;
			break;
	}
}
