if (global.panic == 1)
	if obj_player.character == "N"
		scr_queue_tvanim(choose(spr_pizzanotv_escape1, spr_pizzanotv_escape2, spr_pizzanotv_escape3, spr_pizzanotv_escape4, spr_pizzanotv_escape5, spr_pizzanotv_escape6, spr_pizzanotv_escape7), 240);
	else
		scr_queue_tvanim(choose(spr_pizzytv_escape1, spr_pizzytv_escape2, spr_pizzytv_escape3, spr_pizzytv_escape4, spr_pizzytv_escape5, spr_pizzytv_escape6, spr_pizzytv_escape7), 240);
alarm[1] = irandom_range(300, 1000);
