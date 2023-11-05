function scr_enemy_panicWait()
{
	visible = false;
	hsp = 0;
	vsp = 0;
	x = -900;
	y = -200;
	invincible = true;
	if (global.panic)
	{
		if (!instance_exists(escapePortal) && point_in_rectangle(xstart, ystart, obj_player.x - 500, obj_player.y - 100, obj_player.x + 500, obj_player.y + 100))
		{
			escapePortal = instance_create(xstart, ystart, obj_panicPortal);
			instance_create(xstart, ystart, obj_poofeffect);
			x = xstart;
			y = ystart;
			squashedx = true;
			squashvalx = 0;
			stunned = 20;
			if (!scr_enemyDestroyableCheck(x, y))
			{
				invincible = false;
				visible = true;
				flash = true;
				state = 6;
				sprite_index = stunfallspr;
				image_index = 0;
			}
		}
	}
}
function scr_enemy_secretWait()
{
	visible = false;
	hsp = 0;
	vsp = 0;
	x = -900;
	y = -200;
	invincible = true;
	if (!place_meeting(xstart, ystart, obj_bigdestructibles))
	{
		x = xstart;
		y = ystart;
		visible = true;
		secretjumped = true;
		squashedx = true;
		squashvalx = 0;
		stunned = 3;
		vsp = -8;
		state = 6;
		sprite_index = walkspr;
	}
}
function scr_enemyDestroyableCheck(argument0 = xstart, argument1 = ystart)
{
	if (place_meeting(argument0, argument1, obj_bigdestructibles))
	{
		xstart = argument0;
		ystart = argument1;
		state = 13;
		return true;
	}
	return false;
}
