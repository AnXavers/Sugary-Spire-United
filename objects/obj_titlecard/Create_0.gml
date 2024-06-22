fadealpha = 0;
fadein = 0;
shown = false;
step = 0;
info = 
{
	bginfo: [spr_entrycard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrycard_title, 0, 5, 6, 672, 160],
	featuringinfo: [0, 5, 6, 672, 160],
	song: mu_entryway_title
};
bgX = 0;
bgY = 0;
titleX = 0;
titleY = 0;
featuringX = 0;
featuringY = 0;
depth = -9999;

snd_inst = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(mu_entryway_title));