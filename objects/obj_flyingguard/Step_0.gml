if (state == 22)
{
	if (!instance_exists(sightID) && !alarmed)
	{
		sightID = instance_create(x, y, obj_guardhitbox);
		sightID.ID = id;
	}
	walkspr = alarmed ? 133 : 2013;
	if (state == 22 && alarmed)
		movespeed = 4;
	if (alarm[3] > 0)
		hsp = 0;
}
if (state == 6 || state == 9 || state == 10 || state == 8 || alarmed)
{
	alarm[3] = -1;
	if (instance_exists(sightID))
		instance_destroy(sightID);
}
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
if (state != 8)
	depth = 0;
if (state != 6 && state != 10)
	thrown = 0;
if (boundbox == 0 && state != 14)
{
	with (instance_create(x, y, 382, 
	{
		baddieID: other.id
	}))
	{
		sprite_index = other.sprite_index;
		mask_index = other.mask_index;
		baddieID = other.id;
		other.boundbox = 1;
	}
}
scr_commonenemy();
scr_scareenemy();
var _x = x + (sign(image_xscale) * 150);
