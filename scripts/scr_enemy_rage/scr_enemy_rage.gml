function scr_enemy_rage()
{
	switch (object_index)
	{
		case obj_doggy:
			image_speed = 0.35;
			if (sprite_index == spr_badmarsh_ragestart)
			{
				hsp = 0;
				if (animation_end())
				{
					sprite_index = spr_badmarsh_rage;
					hsp = image_xscale * 5;
					lunged = 50;
					with (instance_create(x, y, obj_forkhitbox, 
					{
						ID: other.id
					}))
					{
						ID = other.id;
						image_xscale = other.image_xscale;
						depth = -1;
					}
				}
			}
			else if (sprite_index == spr_badmarsh_rage)
			{
				hsp = approach(hsp, image_xscale * 8, 0.3);
				lunged--;
				if (lunged <= 0)
				{
					hsp = image_xscale * 4;
					movespeed = 4;
					sprite_index = spr_badmarsh_rageend;
				}
				if (place_meeting_solid(x + image_xscale, y) && !place_meeting_slope(x, y + 1))
				{
					lunged = 0;
					hsp = image_xscale * 4;
					movespeed = 4;
					sprite_index = spr_badmarsh_rageend;
				}
			}
			else if (sprite_index == spr_badmarsh_rageend)
			{
				hsp = approach(hsp, 0, 0.1);
				if (animation_end())
				{
					state = 3;
					movespeed = 1;
					bombreset = 200;
				}
			}
			break;
		case obj_babybear:
			if (animation_end(undefined, 10))
				hsp = image_xscale * 8;
			else
				hsp = 0;
			if (animation_end())
			{
				state = 3;
				sprite_index = walkspr;
			}
			break;
		case obj_sluggy:
			hsp = image_xscale * movespeed;
			if (animation_end())
				movespeed--;
			if (movespeed <= 0)
			{
				state = 3;
				sprite_index = walkspr;
				movespeed = 1;
				hsp = 0;
			}
			break;
		case obj_painter:
			scr_painter_dash();
	}
}
