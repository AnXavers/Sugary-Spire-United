if (!global.freezeframe)
{
	var _player = instance_nearest(x, y, obj_player);
	if (place_meeting(x, y - 1, _player) && _player.grounded && !_player.cutscene && _player.state != 128 && _player.state != 0)
	{
		with (_player)
		{
			if (state == 148 || state == 150 || state == 151)
			{
				state = 149;
				if (move != 0)
					xscale = move;
				else if (hsp != 0)
					xscale = sign(hsp);
			}
			if (state != 149)
				state = 58;
			if (movespeed < 12)
				movespeed = 12;
		}
	}
}
