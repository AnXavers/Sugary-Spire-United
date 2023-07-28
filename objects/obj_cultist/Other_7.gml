if (sprite_index == spr_cultist_pray)
{
	if (pray_delay > 0)
		pray_delay--;
	else
		sprite_index = spr_cultist;
}
