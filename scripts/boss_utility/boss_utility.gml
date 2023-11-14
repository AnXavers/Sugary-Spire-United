function boss_attack_queue(argument0, argument1)
{
	ds_queue_enqueue(atkqueue, argument0, argument1);
}
function boss_create_attack(argument0, argument1, argument2 = 100, argument3 = noone, argument4 = noone)
{
	return 
	{
		atk: argument0,
		diff: argument1,
		time: argument2,
		suba_1: argument3,
		suba_2: argument4
	};
}
function boss_next_attack()
{
	if (ds_queue_empty(atkqueue))
	{
		var b = 254;
		var _atk = b.bossmaxhp - b.bosshp;
		var _length = array_length(phase_atks) - 1;
		_atk = clamp(_atk, 0, _length);
		show_debug_message(_length);
		for (var i = 0; i < array_length(phase_atks[_atk]); i++)
			ds_queue_enqueue(atkqueue, phase_atks[_atk][i]);
	}
	var _next = ds_queue_dequeue(atkqueue);
	show_debug_message(_next);
	state = _next.atk;
	intensity = _next.diff;
	max_intensity = intensity;
	delay = _next.time;
	max_delay = delay;
	subattack_1 = _next.suba_1;
	subattack_2 = _next.suba_2;
	if (state == bossstates.vulnerable)
		flash = true;
}
function face_center_room()
{
	var dir = sign((room_width / 2) - x);
	return dir;
}
function face_obj(argument0)
{
	var dir = sign(argument0.x - x);
	return dir;
}
function scr_grab_boss()
{
	with (obj_player)
	{
		if (state != states.finishingblow || baddiegrabbedID != other.id)
		{
			baddiegrabbedID = other.id;
			supergrabx = other.x - x;
			supergraby = other.y - y;
			sprite_index = spr_lungehit;
			image_index = 0;
			state = states.finishingblow;
		}
	}
	state = 8;
	image_xscale = -obj_player.xscale;
	sprite_index = grabbedspr;
}
