ImportButton.activated = 1
var file = get_open_filename_ext("Palettes|*.sspalette", "", working_directory, "Import your Palette")
if (file != "")
{
	ini_open(file)
	var character = ini_read_string("General", "Character", "NULL")
	ini_close()
	if (character != "NULL" && character == string(obj_player.charname))
	{
		var _original = (((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini")
		file_copy(file, _original)
		with obj_player
			scr_playercolors()
		ini_open((((("Custom/" + string(obj_player.charname)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini"))
		palettename = ini_read_string("General", "PaletteName", "Palette 1")
		ini_close()
		input = palettename
		global.oldcolorchoosen = 0
		global.colorchoosen = 0
		with (obj_palettechangerscrollbar)
			readcolor = 1
		for (var i = 0; i < obj_player.colorheight; i++)
			color[i] = obj_player.color[i]
	}
	else
	{
		show_message((((("Error: Expected " + string(obj_player.charname)) + " Got ") + character) + ". Aborting Import."))
		show_debug_message("TODO: Add an in-game error thingy")
	}
}
