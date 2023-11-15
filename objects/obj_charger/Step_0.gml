if (state == enemystates.stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != enemystates.stun && state != enemystates.frozen)
	birdcreated = 0;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != enemystates.grabbed)
	depth = 0;
if (state != enemystates.stun && state != enemystates.frozen)
	thrown = 0;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox, 
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
if (x != obj_player.x && grounded)
{
	if ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 20) && y >= (obj_player.y - 20)))
	{
		if (state == enemystates.walk)
		{
			state = enemystates.charge;
			substate = substates.unknown_0;
			movespeed = 0;
			image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_banana_chargestart;
			image_index = 0;
		}
	}
}
if (sprite_index == spr_banana_chargestart && floor(image_index) == (image_number - 1))
	sprite_index = spr_banana_charge;
if (hitboxcreate == 0 && state == enemystates.charge && sprite_index == spr_banana_charge)
{
	hitboxcreate = 1;
	with (instance_create(x, y, obj_forkhitbox, 
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
if (state == enemystates.walk)
{
	movespeed = 0;
	hsp = 0;
}
