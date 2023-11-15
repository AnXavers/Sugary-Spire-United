movespeed = 0;
if (!instance_exists(obj_cardboardgummy) && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && sprite_index != spr_cardcherry_getup && sprite_index != spr_cardcherry_idle)
{
	if (sprite_index != spr_cardcherry_getup)
	{
		image_index = 0;
		sprite_index = spr_cardcherry_getup;
	}
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_cardcherry_getup)
{
	sprite_index = spr_cardcherry_idle;
	didthingflag = 1;
}
if (didthingflag == 1 && sprite_index == spr_cardboardcherry)
	sprite_index = spr_cardcherry_idle;
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
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = 1;
	}
}
if (didthingflag == 0)
{
}
if (didthingflag == 1)
	sprite_index = spr_cardcherry_idle;
if (didthingflag == 0 && sprite_index != spr_cardcherry_getup)
	sprite_index = spr_cardboardcherry;
scr_commonenemy();
