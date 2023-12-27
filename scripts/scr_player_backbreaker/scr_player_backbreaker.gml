function state_player_backbreaker()
{
	if (sprite_index != spr_machfreefall)
	{
		hsp = 0;
		movespeed = 0;
	}
	else
		hsp = xscale * movespeed;
	landAnim = 0;
	if (sprite_index == spr_taunt || (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3))
	{
		taunttimer--;
		vsp = 0;
	}
	if (sprite_index == spr_machfreefall && place_meeting(x, y + 1, obj_solid))
	{
		state = states.machslide;
		sprite_index = spr_crouchslide;
	}
	if (sprite_index == spr_taunt)
	{
		if (taunttimer >= 5 && supertauntcharged == 1 && key_up && tauntStored.state != states.trick)
		{
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
			if (global.panic = 1 && global.exitgatetaunt < 10 && place_meeting(x, y, obj_exitgate))
			{
				create_small_number(x, y, "250");
				global.collect += 250
				global.exitgatetaunt++
			}
		}
		if (!instance_exists(parryid))
		{
			with (instance_create(x, y, obj_parryhitbox))
			{
				other.parryid = id;
				image_xscale = other.xscale;
			}
		}
	}
	if (taunttimer <= 0 && sprite_index == spr_taunt)
		scr_taunt_setVariables();
	if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
	{
		vsp = 0;
		hsp = 0;
		supertauntbuffer = 100;
		if (floor(image_index) >= 5 && supertauntcharged == 1)
		{
			instance_create(x, y, obj_supertaunthitbox);
			instance_create(x, y, obj_tauntaftereffectspawner);
			if (!instance_exists(parryid))
			{
				with (instance_create(x, y, obj_parryhitbox))
				{
					other.parryid = id;
					image_xscale = other.xscale;
				}
			}
			with (obj_camera)
			{
				scr_sleep();
				obj_player.state = states.backbreaker;
				shake_mag = 10;
				shake_mag_acc = 30 / room_speed;
			}
			supertauntcharged = false;
		}
		if (animation_end())
		{
			supertauntbuffer = 0;
			supertauntcharged = false;
			scr_taunt_setVariables();
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzelle_eatspaghetti)
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_levelcomplete || sprite_index == spr_noise_victory))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bossintro)
		state = states.normal;
	if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
		image_speed = 0.4;
	else if (sprite_index == spr_taunt)
		image_speed = 0;
	else
		image_speed = 0.35;
}
