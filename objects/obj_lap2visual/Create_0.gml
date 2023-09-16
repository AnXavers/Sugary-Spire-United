sprite_index = obj_player.spr_lapbg_player
y = -sprite_height;
down = 1;
movespeed = 2;
lapvisualimg = 0;
depth = -100;
scr_soundloop(sfx_lapbells)
audio_sound_gain(sfx_lapbells, ((y + sprite_height) / 298), 0)
if global.inflapping != 1
{
	sprite_index = obj_player.spr_lapvisual_player;
	if global.inflapping == 2
	{
		lapvisualimg = (global.lapcount - 2);
	}
}