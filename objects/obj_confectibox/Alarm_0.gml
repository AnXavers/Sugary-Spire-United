sprite_index = obj_player.spr_confectcage_hop;
with (instance_create(x + 50, y + 25, obj_cloudeffect))
	sprite_index = obj_player.spr_confectcage_help;
audio_falloff_set_model(4);
play_sfx(emitter, sound_confectihelp);
audio_sound_gain(snd, global.soundVolume, 0);
