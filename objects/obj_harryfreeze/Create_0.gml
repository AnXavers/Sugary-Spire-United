if (live_call()) return live_result;
grav = 0;
cigar = 0;
stomped = 0;
spr_palette = pal_harry;
paletteselect = 0;
horigin = x;
obj_camera.cam_lzoom = 0.7;
alarm[0] = 100;
audio_pause_all();
if (x != obj_player.x)
	image_xscale = -sign(x - obj_player.x);
sprite_index = obj_player.spr_gummyharry_dead;
