if (state == enemystates.stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
scr_inhaleableenemy()
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
if (hitboxcreate == 0 && (state == 0 || state == 3) && obj_player.state != states.mach3)
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
