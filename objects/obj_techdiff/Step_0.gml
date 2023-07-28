switch (state)
{
	case 0:
		staticdex += 0.35;
		if (staticdex >= (sprite_get_number(spr_static_tech) - 1))
		{
			state = 1;
			with (obj_player)
				scr_playerrespawn(false);
		}
		obj_player.hsp = 0;
		obj_player.vsp = 0;
		break;
	case 2:
		staticdex -= 0.35;
		if (staticdex <= 0)
			instance_destroy();
		break;
}
