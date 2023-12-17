if (obj_player.key_up2 && drawing == 0)
{
	drawing = 1;
	obj_player.state = states.pal;
	with (obj_player)
	{
		paletteselect++;
		if (paletteselect >= palnum)
			paletteselect = 0;
		if (buffer_exists(my_pal_buffer))
			buffer_delete(my_pal_buffer);
	}
}
