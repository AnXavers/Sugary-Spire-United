image_speed = 0.35;
CursorX = 250;
CursorY = 0;
bgx = 0;
bgy = 0;
depth = -99;
PauseMusic = -4;
if (room != realtitlescreen)
{
	PauseMusic = scr_music(mu_paletteselect);
	audio_sound_set_track_position(PauseMusic, global.PAUSE_contTrack_pos);
}
subtitle = "GO BACK TO MAIN SCREEN";
optionselected = 0;
selected = false;
