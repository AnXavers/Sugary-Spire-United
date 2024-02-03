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
if (state != enemystates.thrown)
	scr_scareenemy();
if (bombreset > 0)
	bombreset--;
if (ragereset > 0)
	ragereset--;
if (x != obj_player.x && state != enemystates.thrown && obj_player.state != states.tumble && bombreset <= 0 && grounded)
{
	if (obj_player.x > (x - 80) && obj_player.x < (x + 80) && y <= (obj_player.y + 100) && y >= (obj_player.y - 100))
	{
		if (state == enemystates.walk)
		{
			image_index = 0;
			sprite_index = spr_throw;
			image_xscale = -sign(x - obj_player.x);
			state = 7;
		}
	}
}
