ds_list_add(global.saveroom, id);
p1Vibration(3, 3);
instance_create(x, y, obj_bangeffect);
scr_sound(hitsound);
dvsp = random_range(-7, -10);
dhsp = random_range(5, 10) * DestroyedBy.image_xscale;
spinspeed = random_range(5, 10) * DestroyedBy.image_xscale;
global.clutterhit++
instance_destroy();
