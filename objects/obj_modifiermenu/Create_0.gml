scr_sound(sound_enemythrow)
bgTileX = 0
bgTileY = 0
fadeinrad = 0
surface = surface_create(global.cam_w, global.cam_h);
txtalpha = -60
ScrollY = 0
SelectedY = 0
optionselected = 0;
timer = 0;
sinceup = 0;
sincedown = 0;
surface_set_target(surface);
draw_clear_alpha(0, 0);
surface_reset_target();
canmove = false