function state_player_backbreaker()
{
	if (sprite_index != spr_player_machfreefall)
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
	if (sprite_index == spr_player_machfreefall && place_meeting(x, y + 1, obj_solid))
	{
		state = 71;
		sprite_index = spr_player_crouchslide;
	}
	if (sprite_index == spr_taunt)
	{
		if (taunttimer >= 5 && supertauntcharged == 1 && key_up)
		{
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
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
				obj_player.state = 45;
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
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
		state = 1;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
		state = 1;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
		state = 1;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bossintro)
		state = 1;
	if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3)
		image_speed = 0.4;
	else if (sprite_index == spr_taunt)
		image_speed = 0;
	else
		image_speed = 0.35;
	if (key_down2)
	{
		paletteselect++;
		if (paletteselect >= array_length(my_palettes))
			paletteselect = 0;
		if (buffer_exists(my_pal_buffer))
			buffer_delete(my_pal_buffer);
		taunttimer = 20;
	}
	if (key_up2 && supertauntcharged == 0)
	{
		switch (character)
		{
			case "P":
				character = "N";
				paletteselect = 1;
				break;
			case "N":
				character = "G";
				paletteselect = 1;
				break;
			case "G":
				character = "C";
				paletteselect = 0;
				break;
			case "C":
				character = "P";
				paletteselect = 1;
				break;
		}
		scr_characterspr();
		tauntStored.sprite_index = spr_idle;
		tauntStored.state = 1;
		scr_sound(choose(sound_taunt1, sound_taunt2, sound_taunt3, sound_taunt4, sound_taunt5, sound_taunt6, sound_taunt7, sound_taunt8));
		taunttimer = 20;
		image_index = irandom_range(0, sprite_get_number(spr_taunt));
		sprite_index = spr_taunt;
		with (instance_create(x, y, obj_taunteffect))
			playerID = other.id;
	}
}
