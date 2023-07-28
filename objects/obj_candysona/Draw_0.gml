if (!flash)
	draw_self();
else
	draw_self_flash(c_white);
draw_sprite_ext(spr_candysona_platform, platIndex, xstart, ystart + 46, 1, 1, 0, c_white, platAlpha);
