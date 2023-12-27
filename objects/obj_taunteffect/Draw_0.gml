draw_self();
if obj_player.tauntStored.state == states.trick
	draw_sprite_ext(spr_combotrick, clamp((obj_player.trickcount - 1), 0, sprite_get_number(spr_combotrick - 1)), x - trickxpos, y, 1, 1, 0, c_white, trickalpha);