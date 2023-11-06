function scr_boss_grabbed()
{
	sprite_index = grabbed_spr;
	depth = 0;
	if (obj_player.state == states.superslam)
	{
		if (obj_player.character == "P")
		{
			x = obj_player.x - (obj_player.xscale * 2);
			y = obj_player.y - 104;
		}
		else
		{
			depth = -7;
			x = obj_player.x;
			y = obj_player.y - 104;
		}
	}
	else
	{
		var try_x = 0;
		while (try_x < 60)
		{
			if (!scr_solid(obj_player.x + (try_x * obj_player.xscale), y) && !scr_slopePlatform(obj_player.x + (try_x * obj_player.xscale), y))
				try_x++;
			else
				break;
		}
		x = obj_player.x + (try_x * obj_player.xscale);
		y = obj_player.y - 64;
		hsp = 0;
		vsp = 0;
	}
}
function scr_boss_hurt()
{
	hsp = xscale * -movespeed;
	movespeed = approach(movespeed, 0, 0.05);
	if (stunned > 90)
		stunned = 90;
	stunned--;
	sprite_index = hurt_spr;
	if (thrown)
		vsp = 0;
	if (place_meeting_collision(x + hsp, y))
	{
		xscale *= -1;
		movespeed *= 0.66;
		if (thrown)
		{
			vsp = -9;
			thrown = false;
			flash = true;
			with (obj_bosscontroller)
				event_user(0);
		}
	}
	if (grounded)
		vsp = -4;
	if (stunned <= 0)
	{
		state = bossstates.normal;
		xscale = face_center_room();
		thrown = false;
		ds_queue_clear(atkqueue);
	}
}
function scr_boss_parry()
{
	hsp = approach(hsp, 0, 0.1);
	if (animation_end())
	{
		state = bossstates.normal;
		xscale = face_obj(obj_player);
		thrown = false;
	}
}
