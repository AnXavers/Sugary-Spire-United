with (instance_create(x, y, obj_door))
{
	sprite_index = spr_doorvisited;
	visited = 1;
	targetDoor = other.targetDoor;
	targetRoom = other.targetRoom;
}
