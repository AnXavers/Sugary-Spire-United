switch (state)
{
	case 3:
		if (obj_player.sprite_index != obj_player.spr_taunt)
		{
			state = 0;
			sprite_index = spr_rosette_exitsign;
			if (lap)
				sprite_index = spr_jerald_exitsign;
			image_index = 0;
		}
		break;
	case 2:
		x = -100;
		y = -100;
		if (global.panic && point_distance(xstart, ystart, obj_player.x, obj_player.y) <= 375)
		{
			state = 1;
			vsp = 20;
			sprite_index = spr_rosette_fall;
			if (lap)
				sprite_index = spr_jerald_fall;
			x = xstart;
			y = camera_get_view_y(view_camera[0]) - 100;
		}
		break;
	case 1:
		y += vsp;
		if (vsp < 20)
			vsp += 0.5;
		with (instance_place(x, y, obj_baddiecollisionbox))
		{
			instance_destroy(baddieID);
			instance_destroy();
		}
		if (y >= ystart)
		{
			y = ystart;
			state = 0;
			sprite_index = spr_rosette_exitsign;
			if (lap)
				sprite_index = spr_jerald_exitsign;
			image_index = 0;
		}
		break;
	case 0:
		if (obj_player.sprite_index == obj_player.spr_taunt && dulltimer != 0)
		{
			state = 3;
			if (lap)
			{
				sprite_index = spr_janitor2_taunt;
				image_index = random_range(0, image_number);
			}
			else
				sprite_index = spr_rosette_cheer;
			with (instance_create(x, y, obj_cloudeffect))
			{
				sprite_index = spr_taunteffect;
				depth = 21;
			}
		}
		if (!lap && dulltimer > 0)
			dulltimer--;
		if (dulltimer == 0)
			sprite_index = spr_rosette_dull;
		break;
}
if (state == 2)
	visible = false;
else
	visible = true;
