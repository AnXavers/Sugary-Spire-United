if (room == outer_room1 && obj_player.state == 2)
{
	obj_player.vsp = 5;
	obj_player.xscale = 1;
	obj_player.movespeed = 11;
	obj_player.state = 45;
	obj_player.sprite_index = spr_player_machfreefall;
}
if (global.dolap10fg == 1 && !layer_exists(global.lap10fg))
{
	global.lap10fg = layer_create(-50, "Backgrounds_foreground");
	global.lap10bgspr = layer_background_create(global.lap10fg, bg_collapsing_spire);
	layer_background_htiled(global.lap10bgspr, true);
	layer_background_vtiled(global.lap10bgspr, true);
	layer_vspeed(global.lap10fg, 3);
}