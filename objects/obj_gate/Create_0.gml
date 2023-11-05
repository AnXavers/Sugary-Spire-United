depth = 4;
image_speed = 0.35;
logicMap = ds_map_create();
canCollide = function(argument0 = obj_player)
{
	return currentstate == 1;
};
if (!reversed)
{
	currentstate = 1;
	nextstate = 1;
	queuedEvent = 0;
}
else
{
	currentstate = 0;
	nextstate = 0;
	queuedEvent = 0;
	sprite_index = spr_gateRaised;
}
image_angle = round(image_angle / 90) * 90;
