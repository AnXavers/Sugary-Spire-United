function scr_queue_tvanim(argument0 = noone, argument1 = 150)
{
	with (obj_tv)
	{
		if (expressionsprite != argument0 && argument0 != idletvspr)
		{
			expressionsprite = argument0;
			draw_static = true;
			state = states.tv_transition;
			static_index = 0;
			expressiontime = argument1;
		}
	}
}
function scr_forceplay_tvanim(argument0 = noone, argument1 = 150)
{
	with (obj_tv)
	{
		tvsprite = ds_queue_dequeue(argument0);
		tvlength = ds_queue_dequeue(argument1);
		ds_queue_clear(global.newhudtvanim);
	}
}
function scr_queue_message(argument0 = "", argument1 = noone)
{
	ds_queue_enqueue(global.newhudmessage, argument0);
	if (argument1 != -4)
		scr_queue_tvanim(argument1, 1000);
}
function scr_queue_text(argument0 = ["", ""])
{
	with (obj_tv)
	{
		shownewtext = 1
		if !is_array(argument0)
			new_message = [argument0, ""]
		else
			new_message = argument0
	}
}
function scr_controlprompt(argument0 = "[spr_promptfont]No prompt set", argument1 = argument0, argument2 = string_length(argument0) * 15)
{
	argument2 = clamp(argument2, 60, 450);
	var type = 0;
	if (argument1 == -4)
		type = 1;
	if (argument1 == -1)
		type = 2;
	with (obj_tv)
	{
		if (type != 2)
		{
			if (!ds_list_find_index(global.saveroom, argument1) || type == 1)
			{
				controlprompt = argument0;
				prompt_timer = argument2;
				ds_list_add(global.saveroom, argument1);
			}
		}
		else
		{
			controlprompt = argument0;
			prompt_timer = 2;
		}
	}
	exit;
}
