socketSound = audio_emitter_create();
audio_play_sound_on(socketSound, sfx_socket, true, 100);
audio_emitter_gain(socketSound, global.soundVolume);
image_speed = 0.35;
depth = 4;
image_blend = c_blue;
image_alpha = 0.25;
