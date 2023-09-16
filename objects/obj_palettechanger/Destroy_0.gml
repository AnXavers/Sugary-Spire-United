if instance_exists(obj_palettechangerscrollbar)
	instance_destroy(obj_palettechangerscrollbar);
with obj_player
{
	array_delete(my_palettes, (array_length(my_palettes) - 1), 10)
	ini_open("Custom/Pizzelle_1_palettes.ini")
	global.custompal_1_col_0 = (65536 * ini_read_real("PizzelleColors0", "Red", 0) + (256 * ini_read_real("PizzelleColors0", "Green", 0) + ini_read_real("PizzelleColors0", "Blue", 0)))
	global.custompal_1_col_1 = (65536 * ini_read_real("PizzelleColors1", "Red", 0) + (256 * ini_read_real("PizzelleColors1", "Green", 0) + ini_read_real("PizzelleColors1", "Blue", 0)))
	global.custompal_1_col_2 = (65536 * ini_read_real("PizzelleColors2", "Red", 0) + (256 * ini_read_real("PizzelleColors2", "Green", 0) + ini_read_real("PizzelleColors2", "Blue", 0)))
	global.custompal_1_col_3 = (65536 * ini_read_real("PizzelleColors3", "Red", 0) + (256 * ini_read_real("PizzelleColors3", "Green", 0) + ini_read_real("PizzelleColors3", "Blue", 0)))
	global.custompal_1_col_4 = (65536 * ini_read_real("PizzelleColors4", "Red", 0) + (256 * ini_read_real("PizzelleColors4", "Green", 0) + ini_read_real("PizzelleColors4", "Blue", 0)))
	global.custompal_1_col_5 = (65536 * ini_read_real("PizzelleColors5", "Red", 0) + (256 * ini_read_real("PizzelleColors5", "Green", 0) + ini_read_real("PizzelleColors5", "Blue", 0)))
	ini_close()
	new_palette("Custom Test", 0, global.custompal_1_col_0, global.custompal_1_col_1, global.custompal_1_col_2, global.custompal_1_col_3, global.custompal_1_col_4, global.custompal_1_col_5);
}