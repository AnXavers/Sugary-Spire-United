function scr_sleep(argument0 = undefined)
{
	with (obj_camera)
	{
		if (global.hitstunalarm <= -1 && !global.freezeframe)
		{
			if (is_undefined(argument0))
				freezetype = false;
			else
			{
				freezeval = argument0;
				freezetype = true;
			}
			NextFreeze = true;
		}
	}
}
