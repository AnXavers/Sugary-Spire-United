mask_index = obj_player.spr_mask;
if (scr_solid(x + sign(image_xscale), y, true) && !place_meeting(x + sign(image_xscale), y, obj_destructibles) && !place_meeting(x + sign(image_xscale), y, obj_metalblock) && !place_meeting(x + sign(image_xscale), y, obj_chocofrog))
{
	for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
	{
		with (instance_create(x + irandom_range(-9, 9), y + irandom_range(-9, 9), obj_debris))
		{
			sprite_index = spr_minecartdebris;
			image_index = i;
			vsp = floor(random_range(-5, -9));
			hsp = floor(random_range(-5, 7));
		}
	}
	instance_destroy(id, false);
}
scr_collide();
mask_index = spr_minecart;
if (bbox_top >= (room_height + 100))
	instance_destroy(id, false);
