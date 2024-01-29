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
if (point_in_rectangle(obj_player.x, obj_player.y, x - 200, y - 50, x + 200, y + 50) && obj_player.state != states.door && obj_player.state != states.comingoutdoor)
{
	if (state != enemystates.thrown && state == enemystates.walk && bombreset <= 0)
	{
		image_index = 0;
		flash = true;
		create_heat_afterimage(0);
		state = enemystates.thrown;
		if (x != obj_player.x)
			image_xscale = -sign(x - obj_player.x);
		sprite_index = spr_throw;
	}
}
