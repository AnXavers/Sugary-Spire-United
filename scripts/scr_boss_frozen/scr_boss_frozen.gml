function scr_boss_frozen()
{
	if (global.freezeframe == 0)
	{
		state = frozenstate;
		sprite_index = frozenspriteindex;
		image_index = frozenimageindex;
		image_speed = frozenimagespeed;
		movespeed = frozenmovespeed;
		grav = frozengrav;
		hsp = frozenhsp;
		vsp = frozenvsp;
		if (setfordeath)
		{
			camera_shake(3, 3);
			repeat (2)
				instance_create(x, y, obj_slapstar);
			with (obj_bosscontroller)
				event_user(0);
			setfordeath = 0;
		}
	}
	else
	{
		vsp = 0;
		hsp = 0;
		grav = 0;
		image_speed = 0;
		movespeed = 0;
	}
}
