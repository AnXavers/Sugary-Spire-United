scr_inhaleableenemy()
if (state == enemystates.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != enemystates.stun && state != enemystates.frozen)
	birdcreated = 0;
if (state == enemystates.walk && y > ystart && !scr_solid(x, y - 1))
	y--;
if (state == enemystates.walk && y < ystart && !scr_solid(x, y + 1))
	y++;
if (state == enemystates.stun)
	grav = 0.5;
else
{
	grav = 0;
	vsp = 0;
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != enemystates.grabbed)
	depth = 0;
if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 60) && y >= (obj_player.y - 60))
{
}
if (hitboxcreate == 0 && state == enemystates.charge && sprite_index == spr_swed_charge)
{
	hitboxcreate = 1;
	with (instance_create(x, y, obj_forkhitbox, 
	{
		ID: other.id
	}))
	{
		ID = other.id;
		image_xscale = other.image_xscale;
		image_index = other.image_index;
		depth = -1;
	}
}
if (sprite_index == spr_swed_chargestart && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_swed_charge;
	movespeed = 10;
}
if (bombreset > 0)
	bombreset--;
if (obj_player.bushdetection == 0 && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))) && state == enemystates.walk && bombreset == 0)
{
	if (state != enemystates.charge || state != enemystates.stun)
		state = enemystates.charge;
	if (state == enemystates.charge && sprite_index != spr_swed_charge && sprite_index != scaredspr)
	{
		sprite_index = spr_swed_chargestart;
		image_index = 0;
		image_xscale = -sign(x - obj_player.x);
		bombreset = 250;
	}
}
if (state == enemystates.charge && place_meeting(x + 1, y, obj_solid) && vsp < -18)
{
	state = enemystates.stun;
	vsp++;
	sprite_index = stunfallspr;
	stunned = 100;
}
if (state == enemystates.stun || state == enemystates.walk)
	movespeed = 0;
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
		mask_index = other.mask_index;
		baddieID = other.id;
		other.boundbox = 1;
	}
}
scr_commonenemy();
scr_scareenemy();
