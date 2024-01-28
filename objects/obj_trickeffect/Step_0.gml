x = obj_player.x;
y = obj_player.y + trickypos;
if other.fadein
	image_alpha = approach(image_alpha, 1, 0.1);
else
	image_alpha = approach(image_alpha, 0, 0.03);
if image_alpha == 0
	instance_destroy();
else if image_alpha == 1
	fadein = false;
trickypos -= 0.5;
if obj_player.trickcount > 0
	global.cam_targetzoom = 0.7 + (0.2 / obj_player.trickcount)