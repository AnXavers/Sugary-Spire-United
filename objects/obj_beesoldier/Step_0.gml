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
if (state != enemystates.thrown && state != enemystates.idle)
	scr_scareenemy();
if (bombreset > 0)
	bombreset--;
if (ragereset > 0)
	ragereset--;
if (state == 0)
	bombreset = 0;
if (point_in_rectangle(obj_player.x, obj_player.y, x - 300, y - 50, x + 300, y + 50) && obj_player.state != states.door && obj_player.state != states.comingoutdoor && state != enemystates.walk)
{
	if ((state == 0 || state == 3) && bombreset <= 0)
	{
		if (x != obj_player.x)
			image_xscale = -sign(x - obj_player.x);
		sprite_index = spr_beesoldier_intro;
	}
}
if (state != enemystates.idle && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.changing)
{
	if (state != enemystates.scared && state != enemystates.thrown && bombreset <= 0 && obj_player.state != states.cotton)
	{
		if (state == enemystates.walk || state == enemystates.idle)
		{
			image_index = 0;
			state = 7;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			sprite_index = spr_throw;
		}
	}
}
movespeed = 4;
