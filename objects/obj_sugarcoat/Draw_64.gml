fadealpha -= 0.015
draw_set_alpha(fadealpha);
draw_sprite(spr_sugarcoat, 0, 0, 0)
draw_set_alpha(1);
if fadealpha == 0
	instance_destroy()