ImportButton.activated = true;
var file = get_open_filename_ext("Palettes|*.sspalette", "", working_directory, "Import your Palette");
if (file != "")
{
	ini_open(file);
	var character = ini_read_string("General", "Character", "NULL");
	ini_close();
	if (character != "NULL" && character == string(player.characters))
	{
		var _original = "Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini";
		file_copy(file, _original);
		with (player)
		{
			scr_playercolors();
			customupdate = true;
		}
		ini_open("Custom/" + string(player.characters) + "_" + string(player.customsavedpalette) + "_palettes.ini");
		palettename = ini_read_string("General", "PaletteName", "Palette 1");
		ini_close();
		input = palettename;
		global.oldcolorchoosen = 0;
		global.colorchoosen = 0;
		with (obj_palettechangerscrollbar)
			readcolor = true;
		for (var i = 0; i < player.colorheight; i++)
			color[i] = player.color[i];
	}
	else
	{
		show_message("Error: Expected " + string(player.characters) + " Got " + character + ". Aborting Import.");
		show_debug_message("TODO: Add an in-game error thingy");
	}
}
