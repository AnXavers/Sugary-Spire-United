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
if (((obj_player.x > (x - 50) && obj_player.x < (x + 50)) && (y <= (obj_player.y + 300) && y >= (obj_player.y - 300))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.changing)
{
	if (state != enemystates.thrown && bombreset <= 0 && obj_player.state != states.cotton)
	{
		if (state == enemystates.float)
		{
			image_index = 0;
			state = enemystates.thrown;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_throw;
		}
	}
}
if (state == enemystates.walk)
	state = enemystates.float;
scr_commonenemy();
scr_scareenemy();