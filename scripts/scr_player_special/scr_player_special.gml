function do_special()
{
	if (key_special2 && key_taunt)
	{
		paletteselect++;
		if (paletteselect >= palnum)
			paletteselect = 0;
		if (buffer_exists(my_pal_buffer))
			buffer_delete(my_pal_buffer);
	}
	else if (key_special2 && !typing)
	{
		vsp = 0
		hsp = 0
		sprite_index = spr_winding
		keyboard_string = ""
		typing = 1
	}
	else if typing
	{
		hsp = 0
		vsp = 0
		sprite_index = spr_winding
		msg = keyboard_string
		if (keyboard_check_pressed(vk_enter))
		{
			typing = 0
			state = states.normal;
			sprite_index = spr_idle
		}
	}
}