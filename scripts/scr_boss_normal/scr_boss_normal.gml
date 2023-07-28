function scr_boss_normal()
{
	hsp = approach(hsp, 0, 0.25);
	image_speed = 0.35;
	sprite_index = normal_spr;
	hurted = false;
	var tgtx = 832;
	if (xscale == 1)
		tgtx = 128;
	if (delay > 0)
		delay--;
	if (delay <= 0 && hsp == 0)
		boss_next_attack();
}
