trickypos = -50
image_alpha = 0.5
if !audio_is_playing(sfx_trickend1) && !audio_is_playing(sfx_trickend2)
	scr_sound(asset_get_index("sfx_trick" + string(clamp(obj_player.trickcount, 1, 6))))
image_speed = 0;
image_index = clamp(obj_player.trickcount - 1, 0, image_number - 1)
depth = -1
fadein = true