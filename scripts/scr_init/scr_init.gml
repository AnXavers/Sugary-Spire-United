scribble_anim_wave(0.5, 3, 0.5);
pal_swap_init_system(10, 3, 12);
global.testbuild = 1
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
global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-:.!?()[]{}><\/", 1, 0);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, " ABCDEFGHIJKLMNOPQRSTUVWXYZ.!,abcdefghijklmnopqrstuvwxyz0123456789@#$%^&*(){}[]|:;'/`", 1, 0);
global.combofont = font_add_sprite_ext(spr_fontcombo, "0123456789", 1, 0);
global.collectfont = font_add_sprite_ext(spr_fontcollect, "0123456789", 1, 0);
global.candlefont = font_add_sprite_ext(spr_fontcandle, "0123456789", 1, 0);
global.rankcombofont = font_add_sprite_ext(spr_fontrankcombo, "0123456789", 1, 0);
global.bubblefont = font_add_sprite_ext(spr_bubblefont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", 1, 0);
global.timerfont = font_add_sprite_ext(spr_timer_font, "1234567890", 0, 6);
global.combofont = font_add_sprite_ext(spr_combometer_font, "1234567890x", 1, 2);
global.lapfont = font_add_sprite_ext(spr_lapcount_font, "0123456789", 1, 2);
global.smalllapfont = font_add_sprite_ext(spr_smalllapfont, "0123456789", 1, 0);
global.dialogfont = font_add_sprite_ext(spr_font_dialogue, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.!?:;`'/-_+=1234567890@#$%^&*()[]", 1, 2);
global.buttonfont = font_add_sprite_ext(spr_buttonfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ$%&*()/", 1, 0);
global.promptfont = font_add_sprite_ext(spr_promptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 0);
global.npcfont = font_add_sprite_ext(spr_npcfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-()", 1, 2);
global.erankfont = font_add_sprite_ext(spr_rankbubble_e_font, "Ex1234567890", 1, -10);
global.lapcountpepfont = font_add_sprite_ext(spr_lapcount_font_pep, "0123456789", 1, 2);
global.collectpepfont = font_add_sprite_ext(spr_font_collect, "0123456789", 1, 0);
global.timerpepfont = font_add_sprite_ext(spr_wartimer_font1, "1234567890", 0, 6);
global.combopepfont = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", 1, 0);
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
global.entergateid = inst_6BB1D575;
global.coneballaggro = 0;
global.dolap10fg = 0;
global.petersprite = 0;
global.clutterhit = 0;
global.enableportal = 0;
global.peterimage = -1;
global.solidfellow = 0;
global.cam_w = 960;
global.cam_h = 540;
global.maintainzoom = 0;
global.harrycolor = 0;
global.gamemode = 0;
global.leveldesign = 1;
global.lapmode = 1;
global.jerald = 0;
global.perfect = 0;
global.flashlight = 0;
global.collects = 1;
global.breakables = 1;
global.enemies = 1;
global.escapetimer = 0;
global.preventpause = 0;
global.lowfacefill = time_in_frames(0, 10)
global.secretsspire = [entryway_secret_1, entryway_secret_2, entryway_secret_3, steamy_secret_1, steamy_secret_2, steamy_secret_3, molasses_secret_1, molasses_secret_2, molasses_secret_3, mountain_secret_1, mountain_secret_2, mountain_secret_3, dance_secret1, dance_secret2, dance_secret3, estate_secret1, estate_secret2, estate_secret3, bee_secret_1, bee_secret_2, bee_secret_3, sucrose_secret1, sucrose_secret2, sucrose_secret3, exitway_secret_1, stormy_secret_1, stormy_secret_2, stormy_secret_3, martian_secret_1, entrance_secret3, entrance_secret4, entrance_secret5, medieval_secret4, medieval_secret5, medieval_secret6, dungeon_secret1, dungeon_secret2, dungeon_secret3]
global.secretstotal = array_length(global.secretsspire)
global.secrettime = time_in_frames(0, 25)
global.editorinsts = []
global.editorlayers = []
global.nekocheck = true
var i = 0
var I = 0
for (var i = 0; room_exists(i); i++)
	global.roomlist[i] = room_get_name(i);
for (var i = 0; object_exists(i); i++)
	global.objectlist[i] = object_get_name(i);
for (var i = 0; script_exists(i); i++)
	global.scriptlist[i] = script_get_name(i);
for (var i = 0; sprite_exists(i); i++)
{
	global.spritelist[i] = sprite_get_name(i);
	if string_starts_with(sprite_get_name(i), "ts_")
	{
		global.tilesetlist[I] = sprite_get_name(i)
		I++
	}
}
I = 0
for (var i = 0; room_exists(i); i++)
	global.roomlist[i] = room_get_name(i);
for (var i = 0; audio_exists(i); i++)
{
	global.audiolist[i] = audio_get_name(i);
	if string_starts_with(audio_get_name(i), "mu_")
	{
		global.musiclist[I] = audio_get_name(i)
		I++
	}
}
global.musicreplace = ds_map_create()
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
global.heatmeter = ini_read_real("Settings", "heatmeter", 0);
global.tvmessages = ini_read_real("Settings", "tvmsg", 1);
global.newscorefont = ini_read_real("Settings", "newscorefont", 0);
global.newplayeranim = ini_read_real("Settings", "newplayeranim", 0);
global.erankstack = ini_read_real("Settings", "erankstack", 0);
global.slopeangle = ini_read_real("Settings", "slopeangle", 1);
global.richpresence = ini_read_real("Settings", "richpresence", 0);
global.richpresencetype = ini_read_real("Settings", "richpresencetype", 0);
global.coneballparry = ini_read_real("Settings", "coneballparry", 0);
global.language = ini_read_real("Settings", "language", 0);
global.machsfx = ini_read_real("Settings", "machsfx", 0);
global.eggplantcombo = ini_read_real("Settings", "eggplantcombo", 0);
global.oldhud = ini_read_real("Settings", "oldhud", 0);
global.harryfreeze = ini_read_real("Settings", "harryfreeze", 1);
global.newvoicelines = ini_read_real("Settings", "newvoicelines", 0)
global.moveset = ini_read_real("Settings", "moveset", 0)
global.attackmove = ini_read_real("Settings", "attackmove", 0)
global.destroyables = ini_read_real("Settings", "destroyables", 0)
global.checkpoints = ini_read_real("Settings", "checkpoints", 0)
global.cam_w = ini_read_real("Settings", "reswidth", 960);
global.cam_h = ini_read_real("Settings", "resheight", 540);
global.richpresence = ini_read_real("Settings", "richpresence", 0);
instance_create(-1000, -1000, obj_richpresence)
window_set_size(global.cam_w, global.cam_h)
surface_resize(application_surface, global.cam_w, global.cam_h)
for (i = 0; i < (array_length(global.musiclist) - 1); i++)
{
	if ini_key_exists("Music", audio_get_name(i))
		ds_map_set(global.musicreplace, i, asset_get_index(ini_read_real("Music", audio_get_name(i), noone)));
}
audio_master_gain(global.masterVolume);
global.player_input_device = -2;
global.player_input_device2 = -2;
global.targetCamX = 0;
global.targetCamY = 0;
switch (ini_read_real("Settings", "machsfx", 0))
{
	case 0:
		global.sfxdash1 = sound_dash1
		global.sfxdash2 = sound_dash2
		global.sfxdash3 = sound_dash3
		global.sfxdash4 = sound_dash4
		break;
	case 1:
		global.sfxdash1 = sound_dash1old
		global.sfxdash2 = sound_dash2old
		global.sfxdash3 = sound_dash3old
		global.sfxdash4 = sound_dash4old
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