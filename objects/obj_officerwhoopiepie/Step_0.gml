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
if (boundbox == 0)
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
if (hitboxcreate == 0 && (state == 0 || state == 3) && obj_player.state != 70)
{
	hitboxcreate = 1;
	with (instance_create(x, y, obj_taserhitbox))
		ID = other.id;
}
if (state == 6)
	hitboxcreate = 0;
if (x != obj_player.x)
{
	movespeed = 3;
	image_xscale = -sign(x - obj_player.x);
}
