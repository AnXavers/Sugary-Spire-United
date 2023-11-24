sprite_index = obj_player.spr_lapbg_player
y = -sprite_height;
down = 1;
movespeed = 2;
lapvisualimg = 0;
depth = -100;
b_snd = scr_soundloop(obj_player.sfx_lapbell)
audio_sound_gain(b_snd, 0, 0)
if global.lapmode != 1
{
	sprite_index = obj_player.spr_lapvisual_player;
	lapvisualimg = (global.lapcount - 2);
}