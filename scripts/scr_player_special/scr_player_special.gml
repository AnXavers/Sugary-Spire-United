function do_special()
{
	if (key_special)
	{
		taunttimer = 20;
		scr_taunt_storeVariables();
		state = 45;
		image_index = irandom_range(0, sprite_get_number(spr_taunt));
		sprite_index = spr_taunt;
		instance_create(x, y, obj_taunteffect);
		with (obj_baddie)
		{
			if (point_in_rectangle(x, y, obj_player.x - 480, obj_player.y - 270, obj_player.x + 480, obj_player.y + 270))
				tauntBuffer = true;
		}
		with obj_camera
		{
			freezetype = 0
			event_user(0)
		}
		if (key_down2)
		{
			paletteselect++;
			if (paletteselect >= array_length(my_palettes))
				paletteselect = 0;
			if (buffer_exists(my_pal_buffer))
				buffer_delete(my_pal_buffer);
		}
		if (key_up2)
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
					character = "S";
					paletteselect = 1;
					break;
				case "S":
					character = "T";
					paletteselect = 0;
					break;
				case "T":
					character = "V";
					paletteselect = 0;
					break;
				case "V":
					character = "M";
					paletteselect = 0;
					break;
				case "M":
					character = "P";
					paletteselect = 0;
					break;
			}
			scr_characterglobal();
		}
	}
}