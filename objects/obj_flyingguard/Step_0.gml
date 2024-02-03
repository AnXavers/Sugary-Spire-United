if (state == enemystates.float)
{
	if (!instance_exists(sightID) && !alarmed)
	{
		sightID = instance_create(x, y, obj_guardhitbox);
		sightID.ID = id;
	}
	walkspr = alarmed ? spr_guard_run : spr_guard;
	if alarmed
		movespeed = 4;
	if (alarm[3] > 0)
		hsp = 0;
}
if (state == enemystates.stun || state == enemystates.grabbed || state == enemystates.scared || state == enemystates.frozen || alarmed)
{
	alarm[3] = -1;
	if (instance_exists(sightID))
		instance_destroy(sightID);
}
scr_inhaleableenemy()
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
if (boundbox == 0 && state != enemystates.inhaled)
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
scr_commonenemy();
scr_scareenemy();
var _x = x + (sign(image_xscale) * 150);
