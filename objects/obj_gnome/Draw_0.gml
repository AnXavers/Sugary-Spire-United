if (sprite_index == spr_gnomeMinerIdle && ds_list_find_index(global.saveroom, id) == -1)
	draw_sprite(spr_donutbubble, don, x, y - 35);
pal_swap_set(pal_gnome, colorID - 1, false);
draw_self();
pal_swap_reset();
