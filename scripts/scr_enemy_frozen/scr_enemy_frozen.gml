function scr_enemy_frozen()
{
	if (global.freezeframe == 0)
	{
		state = frozenstate;
		sprite_index = frozenspriteindex;
		image_index = frozenimageindex;
		image_speed = frozenimagespeed;
		movespeed = frozenmovespeed;
		grav = frozengrav;
		hsp = frozenhsp;
		vsp = frozenvsp;
		if (setfordeath)
		{
			eliteHP--;
			if (eliteEnemy && eliteHP != 0 && !important)
			{
				global.combo++;
				var _score = 10 * power(2, global.combo - 1);
				_score = clamp(_score, 10, 80);
				_score = round(_score / eliteHPMax);
				create_small_number(x, y, string(_score));
				global.collect += _score;
				global.combotime = 60;
				global.style += 10;
				global.combofreeze = 30;
			}
			if (!eliteEnemy || eliteHP <= 0)
				instance_destroy();
			setfordeath = 0;
		}
	}
	else
	{
		vsp = 0;
		hsp = 0;
		grav = 0;
		image_speed = 0;
		movespeed = 0;
	}
}
