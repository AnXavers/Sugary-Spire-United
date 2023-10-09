if (!audio_is_playing(b_snd))
{
	b_snd = scr_soundloop(obj_player.sfx_lapbell)
}
if down
{
	var ty = 128
	y = approach(y, ty, movespeed)
	if (y >= ty && alarm[0] == -1)
		alarm[0] = 80
}
else
{
	ty = (-sprite_height)
	y = approach(y, ty, movespeed)
	if (y <= ty)
	{
		audio_stop_sound(b_snd)
		instance_destroy()
	}
}
if (global.lapcount == 1)
{
	audio_stop_sound(b_snd)
	instance_destroy()
}
audio_sound_gain(b_snd, ((y + sprite_height) / 298), 0)
x = 480;
