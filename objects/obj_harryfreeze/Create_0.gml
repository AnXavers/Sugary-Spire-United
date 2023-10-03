depth = -2
grav = 0;
cigar = 0;
stomped = 0;
spr_palette = pal_harry;
paletteselect = 0;
horigin = x;
set_theme = -4
scr_soundloop(sfx_harrypause)
global.freezeframetimer = 65
alarm[0] = global.freezeframetimer;
with obj_camera
{
	freezetype = 0
	event_user(0)
}
if (x != obj_player.x)
	image_xscale = -sign(x - obj_player.x);
sprite_index = obj_player.spr_gummyharry_dead;
global.harryfxval = 1
global.harryfx = fx_create("_filter_tintfilter")
fx_set_parameter(global.harryfx, "g_TintCol", [global.harryfxval, global.harryfxval, global.harryfxval, 1])
global.harryeffect = layer_create(-1, "Effect_Harry")
layer_set_fx(global.harryeffect, global.harryfx)