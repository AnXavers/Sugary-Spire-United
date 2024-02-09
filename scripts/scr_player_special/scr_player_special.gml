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
	if instance_exists(obj_online_client)
	{
		if (keyboard_check_pressed(vk_enter) && !typing)
		{
			state = states.actor
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
				sprite_index = spr_pizzelle_idle
			}
		}
	}
}