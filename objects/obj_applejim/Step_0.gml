bashcooldown--;
if (state == enemystates.walk)
	movespeed = 0;
if (state == 17)
	movespeed = 5;
if (bashcooldown == 0)
{
	sprite_index = spr_applejim_charge;
	state = 17;
	bashcooldown = 200;
}
if (state == enemystates.stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (hp == 0)
	instance_destroy();
if (state != enemystates.stun && state != enemystates.frozen)
	birdcreated = 0;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != enemystates.grabbed)
	depth = 0;
instance_destroy(obj_baddiethrow);
instance_destroy(obj_swordhitbox);
instance_destroy(obj_slaphitbox);
