global.music = scr_music(global.checkpointmusic)
if (global.lapmode == 2)
{
	if global.lapcount >= 4
		instance_create(x, y, obj_coneball)
	if global.lapcount >= 5
		instance_create(x, y, obj_yogurtexe)
}
cutscene_create([cutscene_lapPortal_middle, cutscene_lapPortal_end])