function do_special()
{
	if (key_special)
	{
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