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
if (bombreset > 0)
	bombreset--;
else if (state == 3)
{
	state = 21;
	substate = 0;
	taunttimer = 40;
	with (instance_create(x, y, obj_baddietaunteffect))
		image_speed = 0.25;
	sprite_index = spr_meloncooltaunt;
	image_index = choose(0, 1, 2);
}
if (hitboxcreate == 0 && state == 21)
{
	hitboxcreate = 1;
	with (instance_create(x, y, 394, 
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
if (state != 8)
	depth = 0;
if (state != 6 && state != 10)
	thrown = 0;
if (boundbox == 0 && state != 14 && state != 21)
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
