function cutscene_create(argument0)
{
	global.cutsceneManager = instance_create(0, 0, obj_cutsceneManager);
	with (global.cutsceneManager)
	{
		show_debug_message("QUEUED FUNCTIONS");
		Event = argument0[0];
		show_debug_message(argument0[0]);
		for (var i = 1; i < array_length(argument0); i++)
		{
			ds_queue_enqueue(Cutscene, argument0[i]);
			show_debug_message(argument0[i]);
		}
	}
	return global.cutsceneManager;
}
function cutscene_event_end()
{
	if (!ds_queue_empty(Cutscene))
	{
		var _event = ds_queue_dequeue(Cutscene);
		Event = _event;
		show_debug_message("NEW EVENT");
		show_debug_message(Event);
	}
	else
		instance_destroy();
}
function cutscene_declare_actor(argument0, argument1)
{
	with global.cutsceneManager
	{
		if (ds_exists(ActorMap, 1))
			ds_map_set(ActorMap, argument1, argument0);
	}
	return true;
}
function cutscene_get_actor(argument0)
{
	with (global.cutsceneManager)
	{
		if (ds_exists(ActorMap, 1))
		{
			return ds_map_find_value(ActorMap, argument0);
		}
	}
	return false;
}
