p1Vibration(3, 3);
instance_create(x, y, obj_bangeffect);
scr_sound(sfx_clutterhit);
dvsp = random_range(-7, -10);
dhsp = random_range(5, 10) * DestroyedBy.image_xscale;
spinspeed = random_range(5, 10) * DestroyedBy.image_xscale;
instance_destroy();
