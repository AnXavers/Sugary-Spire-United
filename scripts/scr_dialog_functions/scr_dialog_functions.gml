function queue_dialogue(argument0, argument1 = false)
{
	reset_dialogue();
	if (!instance_exists(obj_dialogue))
		instance_create(0, 0, obj_dialogue);
	with (obj_dialogue)
	{
		if (obj_dialogue.state == 1)
			obj_dialogue.state = 0;
		if (argument1)
			obj_dialogue.state = 2;
		obj_dialogue.curmsg = 0;
	}
	global.dialogmsg = argument0;
}
function reset_dialogue()
{
	instance_destroy(obj_dialogue);
	instance_destroy(obj_dialogue_choices);
	global.dialogmsg = -4;
	global.dialogchoices = -4;
	global.choiced = -4;
}
function create_dialogue(argument0, argument1 = noone, argument2 = noone)
{
	return [argument0, argument1, argument2];
}
function create_choice(argument0, argument1)
{
	return [argument0, argument1];
}
function queue_choices(argument0, argument1)
{
	reset_dialogue();
	with (instance_create(x, y, obj_dialogue_choices))
		msg_text = argument1;
	global.dialogchoices = argument0;
	show_debug_message(global.dialogchoices);
}
function text_wrap(argument0, argument1, argument2, argument3)
{
	var pos_space = -1;
	var pos_current = 1;
	var text_current = argument0;
	if (is_real(argument2))
		argument2 = "#";
	var text_output = "";
	while (string_length(text_current) >= pos_current)
	{
		if (string_width(string_copy(text_current, 1, pos_current)) > argument1)
		{
			if (pos_space != -1)
			{
				text_output += (string_copy(text_current, 1, pos_space) + string(argument2));
				text_current = string_copy(text_current, pos_space + 1, string_length(text_current) - pos_space);
				pos_current = 1;
				pos_space = -1;
			}
			else if (argument3)
			{
				text_output += (string_copy(text_current, 1, pos_current - 1) + string(argument2));
				text_current = string_copy(text_current, pos_current, string_length(text_current) - (pos_current - 1));
				pos_current = 1;
				pos_space = -1;
			}
		}
		pos_current++;
		if (string_char_at(text_current, pos_current) == " ")
			pos_space = pos_current;
	}
	if (string_length(text_current) > 0)
		text_output += text_current;
	return text_output;
}
