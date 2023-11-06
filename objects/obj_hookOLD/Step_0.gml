if (obj_player.state == states.hooks)
	image_alpha = 0.5;
else
	image_alpha = 1;
if (image_alpha == 1)
	audio_emitter_position(hookSoundEmitter, x + (sprite_width / 2), y + (sprite_height / 2), 0);
