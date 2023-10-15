if (freezetype == 0)
	global.hitstunalarm = round(global.freezeframetimer);
if (freezetype == 1)
	global.hitstunalarm = round(freezeval);
if (global.hitstunEnabled != 0)
{
	if (global.freezeframe == 0)
	{
		with (obj_player)
		{
			if (state != 0)
			{
				frozenstate = state;
				frozenspriteindex = sprite_index;
				frozenimageindex = image_index;
				frozenimagespeed = image_speed;
				frozenmovespeed = movespeed;
				frozengrav = grav;
				frozensmash = freefallsmash;
				frozenhsp = hsp;
				frozenvsp = vsp;
				frozenjumpbuffer = input_buffer_jump;
				for (var i = 0; i < 10; i++)
					frozenalarm[i] = alarm_get(i);
				state = 0;
			}
		}
		with (obj_baddie)
		{
			if (state != 10)
			{
				frozenstate = state;
				frozenspriteindex = sprite_index;
				frozenimageindex = image_index;
				frozenimagespeed = image_speed;
				frozenmovespeed = movespeed;
				frozengrav = grav;
				frozenhsp = hsp;
				frozenvsp = vsp;
				state = 10;
			}
		}
		with (obj_iceblock)
		{
			if (state != 10)
			{
				frozenstate = state;
				frozenspriteindex = sprite_index;
				frozenimageindex = image_index;
				frozenimagespeed = image_speed;
				frozenmovespeed = movespeed;
				frozengrav = grav;
				frozenhsp = hsp;
				frozenvsp = vsp;
				state = 10;
			}
		}
		with (par_boss)
		{
			frozenstate = state;
			frozenspriteindex = sprite_index;
			frozenimageindex = image_index;
			frozenimagespeed = image_speed;
			frozenmovespeed = movespeed;
			frozengrav = grav;
			frozenhsp = hsp;
			frozenvsp = vsp;
			state = bossstates.frozen;
		}
		with (par_aftereffect)
		{
			for (i = 0; i < 2; i++)
				frozenalarm[i] = alarm_get(i);
			frozen = true;
			for (i = 0; i < 2; i++)
			{
				if (alarm_get(i) > -1)
					alarm_set(i, -1);
			}
		}
		for (i = 0; i < 3; i++)
			frozenalarm[i] = alarm_get(i);
		for (i = 0; i < 3; i++)
		{
			if (alarm_get(i) > -1)
				alarm_set(i, -1);
		}
		frozen = true;
		with (obj_tv)
		{
			frozenalarm = alarm[1];
			alarm[1] = -1;
			frozen = true;
		}
		global.freezeframe = true;
	}
}
p1Vibration(30, 25);
