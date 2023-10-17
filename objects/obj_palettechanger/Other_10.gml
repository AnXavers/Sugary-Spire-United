ExportButton.activated = 1
var file = get_save_filename_ext("Palettes|*.sspalette", string(obj_player.characters), working_directory, "Export your Palette")
if (file != "")
{
	var _original = (((("Custom/" + string(obj_player.characters)) + "_") + string(obj_player.customsavedpalette)) + "_palettes.ini")
	file_copy(_original, file)
}
