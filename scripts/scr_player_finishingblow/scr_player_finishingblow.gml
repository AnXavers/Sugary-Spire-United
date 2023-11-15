function state_player_finishingblow()
{
	static backto = 0;
	move = key_right + key_left;
	hsp = movespeed;
	backto = approach(backto, 0, 0.25);
	if (floor(image_index) < 5 && sprite_index != obj_player.spr_swingdingend)
		movespeed = approach(movespeed, 0, 0.25);
	else
		movespeed = approach(movespeed, move * 8, 0.5);
	if (animation_end())
	{
		backto = 0;
		state = states.normal;
		movespeed = abs(movespeed);
	}
	var throw_frame = 6;
	if (sprite_index == (spr_pizzano_lungehit))
		throw_frame = 4;
	if (sprite_index == obj_player.spr_lungehit)
		throw_frame = 2;
	if (sprite_index == obj_player.spr_swingdingend)
		throw_frame = 0;
	if (animation_end(undefined, throw_frame) && !instance_exists(obj_swordhitbox))
	{
		movespeed = -xscale * 3;
		vsp = -5;
		backto = -xscale * 5;
		scr_sound(sound_punch);
		scr_sound(sound_killingblow);
		instance_create(x, y, obj_swordhitbox);
		camera_shake(5, 20);
		if (instance_exists(baddiegrabbedID))
		{
			with (baddiegrabbedID)
			{
				instance_create(x, y, obj_slapstar);
				instance_create(x, y, obj_baddiegibs);
				instance_create(x, y, obj_bangeffect);
				with (instance_create(x, y, obj_bangeffect))
					sprite_index = spr_parryeffect;
				hp = 0;
				alarm[1] = 5;
				thrown = true;
				grounded = false;
				if (other.sprite_index != obj_player.spr_uppercutfinishingblow)
				{
					hithsp = obj_player.xscale * 25;
					hitvsp = 0;
				}
				else
				{
					hitvsp = -25;
					hithsp = 0;
				}
				hsp = hithsp;
				vsp = hitvsp;
				linethrown = true;
				state = 6;
				stunned = 500;
			}
		}
		global.combotime = 60;
		global.hit++;
		if (sprite_index == obj_player.spr_lungehit)
		{
			state = states.supergrab;
			movespeed = -xscale * 8;
			hsp = movespeed;
			vsp = 0;
		}
		scr_sleep();
	}
	image_speed = 0.4;
	landAnim = 0;
}
