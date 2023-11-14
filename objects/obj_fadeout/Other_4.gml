with obj_player
{
	if (room == outer_room1 && state == states.titlescreen)
	{
		vsp = 5;
		xscale = 1;
		movespeed = 11;
		state = states.backbreaker;
		sprite_index = spr_machfreefall;
	}
}
if (global.dolap10fg == 1 && !layer_exists(global.lap10fg))
{
	global.lap10fg = layer_create(-50, "Backgrounds_foreground");
	global.lap10bgspr = layer_background_create(global.lap10fg, bg_collapsing_spire);
	layer_background_htiled(global.lap10bgspr, true);
	layer_background_vtiled(global.lap10bgspr, true);
	layer_vspeed(global.lap10fg, 3);
}