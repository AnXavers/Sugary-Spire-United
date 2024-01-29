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
if (bombreset > 0)
	bombreset--;
else if (state == enemystates.walk)
{
	state = enemystates.slugparry;
	substate = substates.unknown_0;
	taunttimer = 40;
	with (instance_create(x, y, obj_baddietaunteffect))
		image_speed = 0.25;
	sprite_index = spr_meloncooltaunt;
	image_index = irandom(2);
}
if (hitboxcreate == 0 && state == enemystates.slugparry)
{
	hitboxcreate = 1;
	with (instance_create(x, y, obj_forkhitbox, 
	{
		ID: other.id
	}))
	{
		ID = other.id;
		sprite_index = spr_swordhitbox2;
		image_xscale = other.image_xscale;
		depth = -1;
	}
}
if (state != enemystates.grabbed)
	depth = 0;
if (state != enemystates.stun && state != enemystates.frozen)
	thrown = 0;
if (boundbox == 0 && state != enemystates.inhaled && state != 21)
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
