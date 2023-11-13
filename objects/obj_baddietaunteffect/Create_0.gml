var tauntsound = asset_get_index("sfx_tauntpizzano" + string(irandom_range(1, 8)));
if (bbox_in_camera(view_camera[0]))
	scr_sound(tauntsound);
image_speed = 0.5;
