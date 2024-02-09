function state_player_pal()
{
	move = key_left2 + key_right2;
	move2 = key_up2 - key_down2;
	if (move != 0)
	{
		switch (character)
		{
			default:
		paletteselect++;
		if (paletteselect >= palnum)
			paletteselect = 0;
		if (buffer_exists(my_pal_buffer))
			buffer_delete(my_pal_buffer);
				break;
		}
		with (obj_palexample)
		{
			instance_create_depth(x, y, -6, obj_poofeffect);
			sprite_index = spr_pizzelle_selectedpal;
			image_index = 0;
		 
		}
	}
	with (obj_playerhatselect)
	{
		if (other.move2 != 0)
			Selection = wrap(image_index + other.move2, 0, arrayEnd - 1);
	}
	if (key_jump)
	{
		if (obj_playerhatselect.HatIndex[obj_playerhatselect.Selection] == 1)
		{
			if (obj_playerhat.image_index != obj_playerhatselect.Selection)
			{
				instance_create(x, y, obj_poofeffect);
				obj_playerhat.image_index = obj_playerhatselect.Selection;
			}
			with (obj_playerhatselect)
				Selection = obj_playerhat.image_index;
			scr_sound(sound_enemythrow);
			state = states.normal;
			targetRoom = hub_w1;
			targetDoor = "C";
			instance_create(x, y, obj_fadeout);
		}
		else
		{
			with (obj_playerhatselect)
			{
				shake = true;
				alarm[1] = 10;
			}
			scr_sound(sound_step);
		}
	}
	sprite_index = spr_pizzelle_idle;
}
