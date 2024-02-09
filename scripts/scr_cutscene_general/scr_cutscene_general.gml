function cutscene_wait(argument0)
{
	timer++;
	if (timer >= argument0)
	{
		timer = 0;
		with (obj_cutsceneManager)
			cutscene_event_end();
	}
	exit;
}
function cutscene_end_player()
{
	obj_player.state = states.normal;
	obj_player.hsp = 0;
	obj_player.vsp = 0;
	obj_player.sprite_index = spr_pizzelle_idle;
	cutscene_event_end();
}
function cutscene_start_player()
{
	obj_player.state = states.actor;
	obj_player.hsp = 0;
	obj_player.vsp = 0;
	obj_player.sprite_index = spr_pizzelle_idle;
	cutscene_event_end();
}
function cutscene_create_instance(argument0, argument1, argument2)
{
	instance_create(argument0, argument1, argument2);
	cutscene_event_end();
}
function cutscene_do_func(func)
{
	func();
	cutscene_event_end();
}
function cutscene_with_actor(actor, func)
{
	var finish = false;
	var _realActor = cutscene_get_actor(actor);
	cutscene_event_end();
	with _realActor
	{
		return func();
	}
}
function cutscene_do_dialog(argument0, argument1 = false)
{
	queue_dialogue(argument0, argument1);
	with (obj_dialogue)
		instant_destroy = argument1;
	cutscene_event_end();
}
function cutscene_wait_dialog()
{
	var finish = 0;
	if (!instance_exists(obj_dialogue) && !instance_exists(obj_dialogue_choices))
		finish = true;
	if (finish)
		cutscene_event_end();
}
function cutscene_lerp_actor(argument0, argument1, argument2, argument3)
{
	var finish = false;
	var _realActor = cutscene_get_actor(argument0);
	with _realActor
	{
		x = lerp(x, argument1, argument3);
		y = lerp(y, argument2, argument3);
		if (distance_to_point(argument1, argument2) <= 4)
		{
			finish = true;
			x = argument1;
			y = argument2;
		}
	}
	if (finish)
		cutscene_event_end();
}
function cutscene_move_actor(argument0, argument1, argument2, argument3)
{
	var finish = false;
	var _realActor = cutscene_get_actor(argument0);
	with _realActor
	{
		var _angel = point_direction(x, y, argument1, argument2);
		var _dirx = lengthdir_x(argument3, _angel);
		var _diry = lengthdir_y(argument3, _angel);
		x = approach(x, argument1, _dirx);
		y = approach(y, argument2, _diry);
		if (x == argument1 && y == argument2)
			finish = true;
	}
	if (finish || !_realActor)
		cutscene_event_end();
}
function cutscene_new_actor(argument0, argument1, argument2, argument3)
{
	var _new_actor = instance_create(argument0, argument1, obj_actor);
	_new_actor.sprite_index = argument2;
	with _new_actor
		cutscene_declare_actor(id, argument3);
	cutscene_event_end();
	return _new_actor;
}
function cutscene_actor_animend(argument0)
{
	var finish = 0;
	var _realActor = cutscene_get_actor(argument0);
	with _realActor
	{
		if (animation_end())
			finish = 1;
	}
	if (finish == 1)
		cutscene_event_end();
}
