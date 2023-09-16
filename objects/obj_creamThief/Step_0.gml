switch (state)
{
	case 0:
		if (sprite_index != spr_creamthief_grab)
		{
			hsp = 0;
			vsp = 0;
		}
		else
		{
			hsp = approach(hsp, 0, 0.6);
			vsp = approach(vsp, 0, 0.6);
		}
		if (sprite_index == spr_creamthief_grab && animation_end())
		{
			sprite_index = spr_creamthief_victory;
			image_xscale = 1;
		}
		image_speed = 0.35;
		break;
	case 1:
		hsp = movespeed * image_xscale;
		if (grounded)
		{
			if (slopeCheck(x, y) && hsp != 0 && movespeed > 8 && movespeed < 12)
				player_slopeMomentum(0.1, 0.2);
			if (movespeed < 8)
				movespeed += 0.2;
		}
		if (grounded)
		{
			sprite_index = spr_creamthief_walk;
			mask_index = obj_player.spr_mask;
			var check1 = place_meeting_collision(x, y);
			mask_index = spr_crouchmask;
			var check2 = !place_meeting_collision(x, y);
			if (check1 && check2)
				sprite_index = spr_creamthief_slide;
		}
		else if (sprite_index != spr_creamthief_jump || (animation_end() && sprite_index == spr_creamthief_jump))
			sprite_index = spr_creamthief_fall;
		image_speed = 0.4;
		break;
	case 2:
		hsp = movespeed * image_xscale;
		instance_destroy(instance_place(x + hsp, y, obj_destructibles));
		if (movespeed < 8)
			movespeed = 8;
		if (animation_end())
		{
			if (sprite_index == spr_creamthief_grabbingStart)
				sprite_index = spr_creamthief_grabbing;
		}
		if ((animation_end() && sprite_index != spr_creamthief_grabbingStart) || sprite_index == spr_creamthief_grabbing)
		{
			if (grounded)
				state = 1;
		}
		image_speed = 0.3;
		break;
	case 3:
		hsp = 0;
		vsp = 0;
		if (taunttimer <= 0)
			scr_taunt_setVariables();
		taunttimer--;
		image_speed = 0;
		break;
	case 4:
		hsp = movespeed * image_xscale;
		movespeed = approach(movespeed, 0, 0.4);
		if (animation_end())
		{
			image_xscale *= -1;
			image_index = 0;
			sprite_index = spr_creamthief_walk;
			movespeed = 8;
			state = 1;
		}
		break;
}
if (hsp != 0)
{
	with (create_afterimage(0, image_xscale))
	{
		gonealpha = 0.45;
		alarm[0] = 1;
		alarm[1] = 60;
	}
}
