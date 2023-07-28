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
if (state != 8)
	depth = 0;
if (state != 6 && state != 10)
	thrown = 0;
if (boundbox == 0 && state != 14)
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
if (state != 7)
	scr_scareenemy();
if (bombreset > 0)
	bombreset--;
if (ragereset > 0)
	ragereset--;
var targetplayer = instance_nearest(x, y, obj_player);
if (x != targetplayer.x && state != 7 && targetplayer.state != 96 && bombreset <= 0 && grounded)
{
	if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100))
	{
		if (state == 3)
		{
			image_index = 0;
			sprite_index = spr_throw;
			image_xscale = -sign(x - targetplayer.x);
			state = 7;
		}
	}
}
