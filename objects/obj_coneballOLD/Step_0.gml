if (!attacking)
{
	alpha = 1;
	if (sprite_index != spr_coneballturn)
		sprite_index = spr_coneball;
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	if (obj_player.x != x && image_xscale != -sign(obj_player.x - x))
	{
		image_xscale = -sign(obj_player.x - x);
		image_index = 0;
		sprite_index = spr_coneballturn;
	}
	if (animation_end() && sprite_index == spr_coneballturn)
		sprite_index = spr_coneball;
	dir = (dir + 1) % 360;
	x = lengthdir_x(dis, dir) + obj_player.x;
	y = lengthdir_y(dis, dir) + obj_player.y;
	dis = lerp(dis, mindis, 0.025);
	timer--;
}
else if (attacking)
{
	if (attack == 1)
	{
		if (obj_player.x != x && image_xscale != -sign(obj_player.x - x) && sprite_index != spr_coneballraintrans)
		{
			image_xscale = -sign(obj_player.x - x);
			image_index = 0;
			sprite_index = spr_coneballrainturn;
		}
		projcool -= 0.75;
		dis = lerp(x, obj_player.x - (150 * obj_player.xscale), 0.025);
		var py = lerp(y, obj_player.y - 150, 0.025);
		if (sprite_index == spr_coneballraintrans && floor(image_index) == (image_number - 1))
			sprite_index = spr_coneballrain;
		if (sprite_index == spr_coneballrainturn && animation_end())
			sprite_index = spr_coneballrain;
		x = dis;
		y = py;
		if (projcool < 0)
		{
			instance_create(random_range(0, room_width), 0, obj_coneprojectile);
			projcool = random_range(5, 10);
		}
	}
	else
	{
		x += obj_player.hsp;
		y += obj_player.vsp;
		sprite_index = spr_coneballspike;
		if (sprite_index == spr_coneballspike && floor(image_index) == (image_number - 1))
		{
			attack = 1;
			fading = false;
			attacking = false;
			alpha = 1;
			atktimer = random_range(450, 575);
		}
	}
}
atktimer--;
if (sprite_index == spr_coneballspike && mask_index != spr_supertaunthitbox && image_index >= 12)
	mask_index = spr_supertaunthitbox;
else if (mask_index == spr_supertaunthitbox && sprite_index != spr_coneballspike)
	mask_index = spr_coneball;
if (atktimer < 0 && !attacking)
{
	image_index = 0;
	sprite_index = spr_coneballraintrans;
	attacking = true;
	atktimer = random_range(450, 575);
}
else if (atktimer < 0 && attacking)
{
	fading = true;
	atktimer = random_range(500, 575);
}
if (fading == 1 && alpha > 0)
	alpha -= 0.25;
if (alpha == 0)
{
	if (attack == 1)
		attack++;
	else
		attack = 1;
	fading = false;
	attacking = false;
	alpha = 1;
	atktimer = random_range(450, 575);
}
if (coneballspeed != 5)
	coneballspeed += 0.01;
if (attacking && attack > 1 && image_index > 12)
{
	if (!audio_is_playing(sfx_coneballspike))
		scr_sound(sfx_coneballspike);
}
if (place_meeting(x, y, obj_player) && attacking && attack > 1 && image_index > 12)
{
	if (timer <= 0)
	{
		with (obj_player)
		{
			if (global.collect <= 0)
			{
				targetRoom = timesuproom;
				targetDoor = "A";
				if (!instance_exists(obj_fadeout))
				{
					instance_create(x, y, obj_fadeout);
					audio_stop_all();
					scr_sound(mu_timesup);
				}
				state = states.timesup;
				global.lapmusic = false;
				instance_destroy(other.id);
			}
		}
	}
}
if (sprite_index == spr_coneballraintrans && image_index > 8)
{
	global.screenflash = 3
	if (!audio_is_playing(sfx_coneballrain))
		scr_sound(sfx_coneballrain);
	shake_mag = 100;
	shake_mag_acc = 20 / room_speed;
}
audio_emitter_position(coneballSound, x, y, 0);
