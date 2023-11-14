if (!global.freezeframe && place_meeting(x, y - 1, obj_player) && obj_player.grounded && !obj_player.cutscene && obj_player.state != states.noclip && obj_player.state != 0)
{
	with (obj_player)
	{
		if (state == states.rupertnormal || state == states.rupertjump || state == states.rupertstick)
		{
			state = states.rupertslide;
			if (move != 0)
				xscale = move;
			else if (hsp != 0)
				xscale = sign(hsp);
		}
		if (state != states.rupertslide)
			state = states.slipnslide;
		if (movespeed < 12)
			movespeed = 12;
	}
}