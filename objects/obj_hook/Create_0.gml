hookSoundEmitter = audio_emitter_create();
hookSound = audio_play_sound_on(hookSoundEmitter, sfx_propeller, true, 100);
audio_emitter_gain(hookSoundEmitter, 1);
image_speed = 0.35;
state = 0;
hookStopID = instance_nearest(x, y, obj_hookstop);
if (!instance_exists(hookStopID))
{
	show_debug_message("Hook didn't find stop");
	alarm[0] = 1;
}
