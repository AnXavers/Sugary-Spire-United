depth = 4;
image_speed = 0.35;
logicMap = ds_map_create();
canCollide = function(argument0 = obj_player)
{
	return currentState == 1;
};
if (!reversed)
{
	currentState = 1;
	nextState = 1;
	queuedEvent = 0;
}
else
{
	currentState = 0;
	nextState = 0;
	queuedEvent = 0;
	sprite_index = spr_gateRaised;
}
image_angle = round(image_angle / 90) * 90;
