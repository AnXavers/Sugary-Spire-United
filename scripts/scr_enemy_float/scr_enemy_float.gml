function scr_enemy_float()
{
	if (object_index != obj_froth && object_index != obj_fizz)
		hsp = image_xscale * movespeed;
	else
		hsp = 0;
	image_speed = 0.35;
	if (object_index != obj_froth || substate == enemystates.idle)
	{
		vsp = 0;
		if (!place_meeting_collision(x, y - 1) && y > ystart)
			y--;
		if (!place_meeting_collision(x, y + 1) && y < ystart)
			y++;
	}
	if (place_meeting_collision(x + sign(hsp), y, 1))
		image_xscale *= -1;
	if (sprite_index == spr_thundercloud_throw)
		sprite_index = walkspr;
	if (object_index == obj_froth)
	{
		var _dir = obj_player.x - x;
		if (substate == substates.unknown_0)
		{
			vsp = 0;
			if (abs(_dir) <= 250 && sprite_index != spr_snowcloudnotice)
			{
				image_index = 0;
				sprite_index = spr_snowcloudnotice;
			}
			if (abs(_dir) > 250 && sprite_index == spr_snowcloudnotice)
			{
				image_index = 0;
				sprite_index = spr_snowcloudnotice_reverse;
			}
			if (animation_end())
			{
				if (sprite_index == spr_snowcloudnotice)
					image_index = image_number - 2;
				if (sprite_index == spr_snowcloudnotice_reverse)
					sprite_index = spr_snowcloudwalk;
			}
			if (abs(_dir) < 90 && y == ystart && !solid_in_line(obj_player) && obj_player.y >= y)
			{
				substate = substates.unknown_1;
				vsp = 0;
				image_index = 0;
				sprite_index = spr_snowclouddive;
			}
		}
		if (substate == 1)
		{
			vsp += 0.5;
			if (sprite_index == spr_snowclouddive && animation_end())
				sprite_index = spr_snowclouddiveboil;
			if (grounded)
			{
				substate = substates.unknown_0;
				sprite_index = spr_snowcloudwalk;
			}
		}
	}
}
