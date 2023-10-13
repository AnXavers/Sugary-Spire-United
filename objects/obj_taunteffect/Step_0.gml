with obj_player
{
	other.x = x;
	other.y = y;
	if (sprite_index != spr_taunt && tauntStored.state != states.trick)
		instance_destroy(other);
	else if ((sprite_index != spr_supertaunt1 || sprite_index != spr_supertaunt2 || sprite_index != spr_supertaunt3) && tauntStored.state == states.trick)
		instance_destroy(other);
	else if tauntStored.state == states.trick
	{
		trickxpos += 1
		trickalpha = wave(0, 1, 2, 0, 0)
		draw_sprite_ext(spr_combotrick, clamp((trickcount - 1), 0, sprite_get_number(spr_combotrick - 1)), x - trickxpos, y, 1, 1, 0, c_white, trickalpha)
	}
}