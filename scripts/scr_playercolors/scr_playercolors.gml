function scr_playercolors()
{
	switch (character)
	{
		case "P":
			charname = "Pizzelle";
			colorheight = 10;
			break;
		case "N":
			charname = "Pizzano";
			colorheight = 10;
			break;
		case "G":
			charname = "Gumbob";
			colorheight = 7;
			break;
		case "C":
			charname = "Coneboy";
			colorheight = 9;
			break;
		case "S":
			charname = "Peppino";
			colorheight = 6;
			break;
		case "T":
			charname = "The Noise";
			colorheight = 6;
			break;
		case "V":
			charname = "Vigilante";
			colorheight = 6;
			break;
		case "M":
			charname = "Pepperman";
			colorheight = 6;
			break;
		case "PN":
			charname = "Pogo Pizzano";
			colorheight = 11;
			break;
		default:
			charname = "BF";
			colorheight = 0;
			break;
	}
	colorindex[0] = 0;
	colorindex[1] = 1;
	colorindex[2] = 2;
	colorindex[3] = 3;
	colorindex[4] = 4;
	colorindex[5] = 5;
	colorindex[6] = 6;
	colorindex[7] = 7;
	colorindex[8] = 8;
	colorindex[9] = 9;
	colorindex[10] = 10;
	colorindex[11] = 11;
	ini_open("Custom/" + string(charname) + "_" + string(customsavedpalette) + "_palettes.ini");
	if (!ini_section_exists(string(charname) + "Colors" + string(colorindex[0])))
	{
		ini_write_real(string(charname) + "Colors" + string(colorindex[0]), "Red", 0);
		ini_write_real(string(charname) + "Colors" + string(colorindex[0]), "Green", 0);
		ini_write_real(string(charname) + "Colors" + string(colorindex[0]), "Blue", 0);
	}
	for (var i = 1; i < colorheight; i++)
	{
		if (!ini_section_exists(string(charname) + "Colors" + string(colorindex[i])))
		{
			ini_write_real(string(charname) + "Colors" + string(colorindex[i]), "Red", 255);
			ini_write_real(string(charname) + "Colors" + string(colorindex[i]), "Green", 255);
			ini_write_real(string(charname) + "Colors" + string(colorindex[i]), "Blue", 255);
		}
	}
	ini_open("Custom/" + string(charname) + "_" + string(customsavedpalette) + "_palettes.ini");
	for (i = 0; i < colorheight; i++)
	{
		colored[colorindex[i]][0] = ini_read_real(string(charname) + "Colors" + string(colorindex[i]), "Red", 0);
		colored[colorindex[i]][1] = ini_read_real(string(charname) + "Colors" + string(colorindex[i]), "Green", 0);
		colored[colorindex[i]][2] = ini_read_real(string(charname) + "Colors" + string(colorindex[i]), "Blue", 0);
	}
	ini_close();
	for (i = 0; i < colorheight; i++)
		color[i] = make_color_rgb(colored[i][0], colored[i][1], colored[i][2]);
}
