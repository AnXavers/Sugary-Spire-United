if keyboard_check_pressed(vk_escape)
{
	if !instance_exists(obj_titlecard) && startgate.do_titlecard
	{
		with instance_create(x, y, obj_titlecard)
			info = startgate.info
	}
	else if !instance_exists(obj_fadeout) && !startgate.do_titlecard
	{
		instance_create(x, y, obj_fadeout);
		obj_tv.tvsprite = spr_tvturnon;
		obj_tv.image_index = 0;
	}
}
bgTileX++
bgTileY++
fadeinrad = lerp(fadeinrad, ((global.cam_w + global.cam_h) / 2), 0.03)