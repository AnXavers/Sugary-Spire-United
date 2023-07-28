function scr_confecti_init()
{
	ds_list_add(global.FollowerList, id);
	switch (object_index)
	{
		default:
			spr_idle = spr_marshmellow_idle;
			spr_run = spr_marshemellow_run;
			spr_runpanic = spr_marshmellow_panicWalk;
			spr_panic = spr_marshmellow_panic;
			spr_appear = spr_marshmallow_appear;
			spr_taunt = spr_marshmellow_taunt;
			global.mallowfollow = true;
			scr_queue_tvanim(spr_pizzytv_confecti1, 100);
			break;
		case obj_confectichoco:
			spr_idle = spr_chocolate_idle;
			spr_run = spr_chocolate_walk;
			spr_runpanic = spr_chocolate_panicWalk;
			spr_panic = spr_chocolate_panic;
			spr_appear = spr_chocolate_appear;
			spr_taunt = spr_chocolate_taunt;
			global.chocofollow = true;
			scr_queue_tvanim(spr_pizzytv_confecti2, 100);
			break;
		case obj_confecticrack:
			spr_idle = spr_crack_idle;
			spr_run = spr_crack_run;
			spr_runpanic = spr_crack_panicWalk;
			spr_panic = spr_crack_panic;
			spr_appear = spr_crack_appear;
			spr_taunt = spr_crack_taunt;
			global.crackfollow = true;
			scr_queue_tvanim(spr_pizzytv_confecti3, 100);
			break;
		case obj_confectiworm:
			spr_idle = spr_gummyworm_idle;
			spr_run = spr_gummyworm_walk;
			spr_runpanic = spr_gummyworm_panicWalk;
			spr_panic = spr_gummyworm_panic;
			spr_appear = spr_gummyworm_appear;
			spr_taunt = spr_gummyworm_taunt;
			global.wormfollow = true;
			scr_queue_tvanim(spr_pizzytv_confecti4, 100);
			break;
		case obj_confecticandy:
			spr_idle = spr_candy_idle;
			spr_run = spr_candy_walk;
			spr_runpanic = spr_candy_panicWalk;
			spr_panic = spr_candy_panic;
			spr_appear = spr_candy_appear;
			spr_taunt = spr_candy_taunt;
			global.candyfollow = true;
			scr_queue_tvanim(spr_pizzytv_confecti5, 100);
			break;
		case obj_rudejanitor:
			spr_idle = spr_rudejanitor_idle;
			spr_run = spr_rudejanitor_walk;
			spr_runpanic = spr_rudejanitor_panicwalk;
			spr_panic = spr_rudejanitor_panicidle;
			spr_appear = spr_rudejanitor_appear;
			spr_taunt = spr_rudejanitor_taunt;
			global.janitorRudefollow = true;
			break;
		case obj_lapjanitor:
			spr_idle = spr_janitor2_idle;
			spr_run = spr_janitor2_run;
			spr_runpanic = spr_janitor2_run;
			spr_panic = spr_janitor2_idle;
			spr_appear = spr_janitor2_jump;
			spr_taunt = spr_janitor2_taunt;
			global.janitorLapfollow = true;
			break;
	}
}
