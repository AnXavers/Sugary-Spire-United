if (!global.freezeframe)
{
	if (obj_player.state == states.cotton)
		draw_alpha = (clamp(obj_player.movespeed - 6, 0, 2) / 2) * 0.45;
	else if (obj_player.state == states.cottonroll)
		draw_alpha = (obj_player.movespeed / 8) * 0.45;
	else if (obj_player.state == states.cottondrill || obj_player.state == states.cottonspring)
		draw_alpha = (abs(obj_player.vsp) / 20) * 0.45;
	if (image_alpha > 0)
		image_alpha -= 0.06;
	if (image_alpha <= 0)
		instance_destroy();
}
