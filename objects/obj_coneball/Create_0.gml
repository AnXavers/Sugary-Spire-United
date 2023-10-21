depth = -100;
scr_sound(sfx_coneball);
sprite_index = obj_player.spr_coneball_player
image_speed = 0.35;
image_alpha = 0;
alarm[0] = 10;
coneballspeed = 1;
parryspeed = 1;
coneballtype = 0;
x = obj_player.x;
y = obj_player.y;
dis = 800;
mindis = 150;
dir = 0;
timer = 150;
attacking = false;
atktimer = 250;
projcool = 5;
fading = false;
alpha = 1;
attack = 1;
with instance_create(x, y, obj_icontracker)
{
	target = other
	sprite_index = spr_icon_coneball
	image_speed = 0.35
}