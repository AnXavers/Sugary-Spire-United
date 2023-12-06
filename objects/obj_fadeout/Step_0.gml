if (fadealpha > 1 && !place_meeting(obj_player.x, obj_player.y, obj_startgate))
{
	fadein = 1;
	if (instance_exists(obj_player) && !place_meeting(x, y, obj_startgate))
	{
		if (room_exists(obj_player.targetRoom))
			room_goto(obj_player.targetRoom);
		else
			room_goto(devroom);
	}
}
if (fadein == 0)
	fadealpha += 0.1;
else if (fadein == 1)
	fadealpha -= 0.1;
if (instance_exists(obj_player))
{
	with (obj_player)
	{
		if (other.fadein == 1 && (state == states.door || state == states.victory) && (place_meeting(x, y, par_door) || place_meeting(x, y, obj_startgate)))
		{
			state = states.comingoutdoor;
			image_index = 0;
		}
		if (other.fadein == 1 && state == states.door && (sprite_index == spr_downpizzabox || sprite_index == spr_uppizzabox))
			state = states.crouchjump;
	}
}
if (fadein == 1 && fadealpha < 0)
	instance_destroy();
if (fadein == 0 && fadealpha > 1)
{
	if (instance_exists(obj_titlecard))
		instance_destroy(obj_titlecard);
}
