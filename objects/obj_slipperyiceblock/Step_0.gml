if (!global.freezeframe && place_meeting(x, y - 1, obj_player) && obj_player.grounded && !obj_player.cutscene && obj_player.state != 128 && obj_player.state != 0)
{
	with (obj_player)
	{
		if (state == states.rupertstick || state == states.supergrab || state == 151)
		{
			state = states.honey;
			if (move != 0)
				xscale = move;
			else if (hsp != 0)
				xscale = sign(hsp);
		}
		if (state != states.honey)
			state = 58;
		if (movespeed < 12)
			movespeed = 12;
	}
}