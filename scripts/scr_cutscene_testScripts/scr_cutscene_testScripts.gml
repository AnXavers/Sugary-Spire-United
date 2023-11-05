function cutscene_shake_actor(argument0, argument1)
{
	var _dump = cutscene_get_actor(argument0);
	with _dump
	{
		shake_magx = argument1;
		shake_dir = 1;
		shake_timer = 0;
	}
	cutscene_event_end();
}
