function scr_setgmliverooms(room)
{
    var _bool = false;
    switch room_get_name(room)
    {
        case "exitway_1":
        case "exitway_2":
        case "exitway_3":
        case "exitway_4":
        case "exitway_secret1":
            _bool = true;
            break;
    }

    return _bool;
}

scribble_anim_wave(0.5, 3, 0.5);
pal_swap_init_system(10, 3, 12);
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
global.GMLIVE_roomstart = false;
global.GMLIVE_prevroom = 0;
global.GMLIVE_realroom = 0;
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
global.dialogfont = font_add_sprite_ext(spr_font_dialogue, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,.!?:;`'/-_+=1234567890@#$%^&*()[]", 1, 2);
global.buttonfont = font_add_sprite_ext(spr_buttonfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ$%&*()/", 1, 0);
global.promptfont = font_add_sprite_ext(spr_promptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", 1, 0);
global.npcfont = font_add_sprite_ext(spr_npcfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", 1, 2);
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
global.lapcount = 0;

ini_open("optionData.ini");
global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
global.selectedResolution = ini_read_real("Settings", "resolution", 1);
global.smoothcam = ini_read_real("Settings", "smthcam", 1);
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
global.screentilt = ini_read_real("Settings", "scrntilt", 1);
global.screenmelt = ini_read_real("Settings", "screenmelt", 1);
global.lowperformance = ini_read_real("Settings", "lowperf", 1);
global.smoothscale = ini_read_real("Settings", "smoothscale", 0);
global.playerrotate = ini_read_real("Settings", "playrot", 1);
global.musicVolume = ini_read_real("Settings", "musicvol", 0.6);
global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
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
		break;
	case 1:
		window_set_size(960, 540);
		break;
	case 2:
		window_set_size(1280, 720);
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
var _emptyfuckroom = room_add();
room_assign(_emptyfuckroom, rm_blank);
room_instance_add(_emptyfuckroom, 0, 0, obj_eventtrigger327);
for (var i = 0; room_exists(i); i++)
{
	if (scr_setgmliverooms(i))
		room_assign(i, _emptyfuckroom);
}
global.doorsave = ds_list_create();
global.afterimage_list = ds_list_create();
