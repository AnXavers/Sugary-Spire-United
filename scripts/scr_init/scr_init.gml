scribble_anim_wave(0.5, 3, 0.5);
pal_swap_init_system(10, 3, 12);
global.fileselect = "saveData.ini"
global.levelname = "none";
global.firstlvlRoom = 66;
global.secretfound = 0;
global.showplaytimer = false;
global.playmiliseconds = 0;
global.playseconds = 0;
global.playminutes = 0;
global.playhour = 0;
global.fill = 0;
global.freezeframe = false;
global.freezeframetimer = 5;
global.greyscalefade = 0;
global.music = -4;
global.harrymusic = -4;
global.shopmusic = -4;
global.PAUSE_contTrack_pos = 0;
global.dialogmsg = 0;
global.dialogchoices = 0;
global.choiced = 0;
global.dialogNPC = -4;
global.exitgatetaunt = 0
global.dancetimer = 0;
global.maxdancetimer = 0;
global.martian_alarmed = false;
global.minesProgress = false;
global.MinesFlags[0] = false;
global.MinesFlags[1] = false;
global.MinesFlags[2] = false;
global.MinesFlags[3] = false;
global.MinesFlags[4] = false;
global.MinesFlags[5] = false;
global.MinesFlags[6] = false;
global.cutsceneManager = -4;
global.combomode = false;
global.font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.0123456789:- ", 1, 0);
global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-:", 1, 0);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, " ABCDEFGHIJKLMNOPQRSTUVWXYZ.!,abcdefghijklmnopqrstuvwxyz0123456789@#$%^&*(){}[]|:;'/`", 1, 0);
global.combofont = font_add_sprite_ext(spr_fontcombo, "0123456789", 1, 0);
global.collectfont = font_add_sprite_ext(spr_fontcollect, "0123456789", 1, 0);
global.candlefont = font_add_sprite_ext(spr_fontcandle, "0123456789", 1, 0);
global.rankcombofont = font_add_sprite_ext(spr_fontrankcombo, "0123456789", 1, 0);
global.bubblefont = font_add_sprite_ext(spr_bubblefont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", 1, 0);
global.timerfont = font_add_sprite_ext(spr_timer_font, "1234567890", 0, 6);
global.combofont = font_add_sprite_ext(spr_combometer_font, "1234567890x", 1, 2);
global.lapfont = font_add_sprite_ext(spr_lap_font, "1234567890", 1, 2);
global.lapcountfont = font_add_sprite_ext(spr_lapcount_font, "0123456789", 1, 2);
global.dialogfont = font_add_sprite_ext(spr_font_dialogue, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.!?:;`'/-_+=1234567890@#$%^&*()[]", 1, 2);
global.buttonfont = font_add_sprite_ext(spr_buttonfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ$%&*()/", 1, 0);
global.promptfont = font_add_sprite_ext(spr_promptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 0);
global.npcfont = font_add_sprite_ext(spr_npcfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", 1, 2);
global.rankfont = font_add_sprite_ext(spr_rankbubble_e_font, "E", 1, -10);
global.lapcountpepfont = font_add_sprite_ext(spr_lapcount_font_pep, "0123456789", 1, 2);
global.shellactivate = false;
global.showcollisions = false;
global.debugmode = false;
global.fartcounter = 0;
global.parallaxbg_surface = -4;
global.ParallaxMap = ds_map_create();
scr_default_parallax(true);
global.FollowerList = ds_list_create();
global.mallowfollow = false;
global.crackfollow = false;
global.chocofollow = false;
global.wormfollow = false;
global.candyfollow = false;
global.janitorRudefollow = false;
global.janitorLapfollow = false;
global.janitortype = 1;
global.lapcount = 1;
global.Eranklength = 1;
global.isoldw1 = 0;
global.entergateroom = hub_hallway;
global.entergatedoor = "A";
global.coneballaggro = 0;
global.dolap10fg = 0;
global.petersprite = 0;
global.clutterhit = 0;
global.enableportal = 0;
global.peterimage = -1;
ini_open("silversave.ini")
global.keypieces = ini_read_real("Unlocks", "keypieces", 0);
global.unlockshell = ini_read_real("Unlocks", "shell", 0);
global.unlockmusic = ini_read_real("Unlocks", "custommusic", 0);
global.unlocklvldesign = ini_read_real("Unlocks", "leveldesign", 0);
global.unlockplayeranim = ini_read_real("Unlocks", "playeranim", 0);
global.unlockinflapping = ini_read_real("Unlocks", "inflapping", 0);
global.unlockheatmeter = ini_read_real("Unlocks", "heatmeter", 0);
global.unlockjerald = ini_read_real("Unlocks", "jerald", 0);
global.unlockweakcone = ini_read_real("Unlocks", "weakcone", 0);

ini_open("optionData.ini");
global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
global.selectedResolution = ini_read_real("Settings", "resolution", 1);
global.smoothcam = ini_read_real("Settings", "smthcam", 1);
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
global.screentilt = ini_read_real("Settings", "scrntilt", 1);
global.screenmelt = ini_read_real("Settings", "screenmelt", 1);
global.lowperformance = ini_read_real("Settings", "lowperf", 0);
global.smoothscale = ini_read_real("Settings", "smoothscale", 0);
global.playerrotate = ini_read_real("Settings", "playrot", 1);
global.musicVolume = ini_read_real("Settings", "musicvol", 0.6);
global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
global.defaultlapmusic = ini_read_real("Settings", "defaultlap", 0);
global.mulap10 = ini_read_real("Settings", "mu_lap10", 0);
global.mulap5 = ini_read_real("Settings", "mu_lap5", 0);
global.mulap2 = ini_read_real("Settings", "mu_lap2", 0);
global.muescape = ini_read_real("Settings", "mu_escape", 0);
global.muoverdose = ini_read_real("Settings", "mu_lap2", 0);
global.mulowface = ini_read_real("Settings", "mu_escape", 0);
global.heatmeter = ini_read_real("Settings", "heatmeter", 0);
global.tvmessages = ini_read_real("Settings", "tvmsg", 1);
global.newscorefont = ini_read_real("Settings", "newscorefont", 0);
global.newplayeranim = ini_read_real("Settings", "newplayeranim", 0);
global.newlvldesign = ini_read_real("Settings", "newlvldesign", 0);
global.erankstack = ini_read_real("Settings", "erankstack", 0);
global.slopeangle = ini_read_real("Settings", "slopeangle", 1);
global.inflapping = ini_read_real("Settings", "inflapping", 1);
global.enablejerald = ini_read_real("Settings", "enablejerald", 1);
global.richpresense = ini_read_real("Settings", "richpresense", 0);
global.richpresensetype = ini_read_real("Settings", "richpresensetype", 0);
global.coneballparry = ini_read_real("Settings", "coneballparry", 0);
global.language = ini_read_real("Settings", "language", 0);
ini_close();

audio_master_gain(global.masterVolume);
global.player_input_device = -2;
global.player_input_device2 = -2;
global.targetCamX = 0;
global.targetCamY = 0;
ini_open("optionData.ini");
switch (ini_read_real("Settings", "resolution", 1))
{
	case 0:
		window_set_size(480, 260);
		window_set_min_width(480)
		window_set_min_height(260)
		break;
	case 1:
		window_set_size(960, 540);
		window_set_min_width(960)
		window_set_min_height(540)
		break;
	case 2:
		window_set_size(1280, 720);
		window_set_min_width(1280)
		window_set_min_height(720)
		break;
	case 3:
		window_set_size(1920, 1080);
		window_set_min_width(1920)
		window_set_min_height(1080)
		break;
	case 4:
		window_set_size(3840, 1080);
		window_set_min_width(3840)
		window_set_min_height(1080)
		break;
}
switch (ini_read_real("Settings", "mu_lap10", 0))
{
	case 0:
		global.lap10song = mu_sucrose;
		break;
	case 1:
		global.lap10song = mu_finale;
		break;
	case 2:
		global.lap10song = mu_mayhem;
		break;
	case 3:
		global.lap10song = mu_lap4;
		break;
}
switch (ini_read_real("Settings", "mu_lap5", 0))
{
	case 0:
		global.lap5song = mu_despairy;
		break;
	case 1:
		global.lap5song = mu_pizzanodespairy;
		break;
	case 2:
		global.lap5song = mu_despairypeppino;
		break;
	case 3:
		global.lap5song = mu_overdose;
		break;
}
switch (ini_read_real("Settings", "mu_lap2", 0))
{
	case 0:
		global.lap2song = mu_lap;
		break;
	case 1:
		global.lap2song = mu_pizzanolap;
		break;
	case 2:
		global.lap2song = mu_noiselap;
		break;
	case 3:
		global.lap2song = mu_peppinolap;
		break;
}
switch (ini_read_real("Settings", "mu_escape", 0))
{
	case 0:
		global.escapesong = mu_escape;
		break;
	case 1:
		global.escapesong = mu_pizzanoescape;
		break;
	case 2:
		global.escapesong = mu_noiseescape;
		break;
	case 3:
		global.escapesong = mu_peppinoescape;
		break;
}
switch (ini_read_real("Settings", "mu_overdose", 0))
{
	case 0:
		global.overdosesong = mu_overdose;
		break;
	case 1:
		global.overdosesong = mu_finale;
		break;
}
switch (ini_read_real("Settings", "mu_lowface", 0))
{
	case 0:
		global.lowfacesong = mu_lowface;
		break;
	case 1:
		global.lowfacesong = mu_expurgation;
		break;
}
window_set_fullscreen(ini_read_real("Settings", "fullscrn", 0));
ini_close();
audio_sound_gain(sfx_combovoice1p, 2, 0);
audio_sound_gain(sfx_combovoice2p, 2, 0);
audio_sound_gain(sfx_combovoice3p, 2, 0);
audio_sound_gain(sfx_combovoice4p, 2, 0);
audio_sound_gain(sfx_combovoice5p, 2, 0);
audio_sound_gain(sfx_combovoice6p, 2, 0);
audio_sound_gain(sfx_combovoice7p, 2, 0);
audio_sound_gain(sfx_combovoice8p, 2, 0);
gml_release_mode(true);
global.doorsave = ds_list_create();
global.afterimage_list = ds_list_create();