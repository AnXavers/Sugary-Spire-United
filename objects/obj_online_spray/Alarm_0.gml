if (objectID == obj_player)
    sprite_index = obj_online_data.spr_spray
else
    sprite_index = objectID.spr_spray
if (!((instance_exists(obj_pause) && obj_pause.pause)))
    scr_sound(sound_stamp)
