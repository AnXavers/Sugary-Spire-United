function do_special()
{
	if (key_special2)
	{
		paletteselect++;
		if (paletteselect >= palnum)
			paletteselect = 0;
		if (buffer_exists(my_pal_buffer))
			buffer_delete(my_pal_buffer);
	}
}