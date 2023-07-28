function state_player_frozen()
{
	move = key_right + key_left;
	if (!key_jump2)
		input_buffer_jump = frozenjumpbuffer;
	else
		input_buffer_jump = 0;
	if (global.freezeframe == 1)
	{
		for (var i = 0; i < 10; i++)
		{
			if (alarm_get(i) > 0)
				alarm_set(i, -1);
		}
		vsp = 0;
		hsp = 0;
		image_speed = 0;
		movespeed = 0;
		cutscene = true;
	}
	else
	{
		for (i = 0; i < 10; i++)
			alarm_set(i, frozenalarm[i]);
		sprite_index = frozenspriteindex;
		image_index = frozenimageindex;
		image_speed = frozenimagespeed;
		movespeed = frozenmovespeed;
		grav = frozengrav;
		freefallsmash = frozensmash;
		hsp = frozenhsp;
		vsp = frozenvsp;
		state = frozenstate;
		cutscene = false;
	}
}
