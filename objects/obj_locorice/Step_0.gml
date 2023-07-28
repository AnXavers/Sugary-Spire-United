if (point_in_circle(x, y, obj_player.x + (75 * obj_player.xscale), obj_player.y, 125) && obj_player.inhaling && state != 14)
	state = 14;
if (state == 6 && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 6 && state != 10)
	birdcreated = 0;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (hitboxcreate == 0 && active)
{
	hitboxcreate = 1;
	with (instance_create(x, y, 394, 
	{
		ID: other.id
	}))
	{
		ID = other.id;
		image_xscale = other.image_xscale;
		image_index = other.image_index;
		depth = -1;
	}
}
if (state != 8)
	depth = 0;
if (state != 6 && state != 10)
	thrown = 0;
if (active)
{
	scr_commonenemy();
	scr_scareenemy();
}
if (state == 0 && active)
	state = 16;
