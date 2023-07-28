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
if (!pizzano)
	scr_scareenemy();
scr_commonenemy();
var targetplayer = instance_nearest(x, y, obj_player);
if (x != targetplayer.x && grounded)
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
	{
		if (state == 3)
		{
			state = 1;
			substate = 0;
			movespeed = 0;
			image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_banana_chargestart;
			image_index = 0;
		}
	}
}
if (sprite_index == spr_banana_chargestart && floor(image_index) == (image_number - 1))
	sprite_index = spr_banana_charge;
if (hitboxcreate == 0 && state == 1 && sprite_index == spr_banana_charge)
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
		sprite_index = spr_chargershitbox;
		mask_index = spr_chargershitbox;
	}
}
if (state == 3)
{
	movespeed = 0;
	hsp = 0;
}
