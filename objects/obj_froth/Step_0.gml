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
if (bombreset > 0)
	bombreset--;
if (state == 6)
	grav = 0.5;
else
	grav = 0;
if (state == enemystates.walk)
	state = enemystates.float;
scr_commonenemy();
if (state != enemystates.float || substate == substates.unknown_0)
	scr_scareenemy();
if (state != enemystates.float)
	substate = substates.unknown_0;
if (place_meeting(x, y + 1, obj_player) && state == enemystates.float && substate == substates.unknown_1 && sprite_index == spr_snowclouddiveboil)
{
	with (obj_player)
	{
		hsp = 0;
		player_x = x;
		state = states.bushdisguise;
		sprite_index = spr_frothstuck;
		bushdetection = 3;
	}
	instance_destroy();
}
if (substate == 0)
	y = approach(y, ystart, 2);
