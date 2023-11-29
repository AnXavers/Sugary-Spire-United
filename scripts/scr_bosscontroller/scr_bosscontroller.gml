function scr_bosscontroller_intro()
{
	if (showing_player)
	{
		player_scale = approach(player_scale, 1, 0.8);
		player_shake = approach(player_shake, 0, 0.8);
	}
	if (showing_boss)
	{
		boss_scale = approach(boss_scale, 1, 0.8);
		boss_shake = approach(boss_shake, 0, 0.8);
	}
	if (showing_names)
	{
		name_shake = approach(name_shake, 0, 1.2);
		versus_shake = approach(versus_shake, 0, 1.5);
	}
	switch (intro_state)
	{
		case 0:
			color_fade = approach(color_fade, 255, 10);
			color = make_color_hsv(0, 0, color_fade);
			if (color_fade >= 255)
				intro_state = 1;
			break;
		case 1:
			fadeout = approach(fadeout, 0, 0.1);
			if (!showing_player)
			{
				showing_player = true;
				player_shake = 45;
				player_color = 0;
				alarm[0] = 10;
			}
			break;
		case 2:
			if (intro_timer > 0)
			{
				intro_timer--;
				fadeout = approach(fadeout, 0, 0.1);
			}
			else
			{
				fadeout = approach(fadeout, 1, 0.1);
				color = 0;
				if (fadeout == 1)
				{
					intro_state = 3;
					showing_versus = false;
				}
			}
			break;
		case 3:
			fadeout = approach(fadeout, 0, 0.1);
			state = 1;
			break;
	}
}
function scr_bosscontroller_normal()
{
	if (boss_func != -4)
		self.boss_func();
	if (bosshp != lastbosshp)
		lastbosshp = bosshp;
}
function scr_bosscontroller_draw_health(argument0 = spr_pizzelle_hp, argument1 = 1, argument2 = playmaxhp, argument3 = playhp, argument4 = 64, argument5 = 50, argument6 = argument2 / 2, argument7 = 54, argument8 = 52, argument9 = playhpindex)
{
	for (var i = 0; i < argument2; i++)
	{
		var _color = (i < argument3) ? c_white : 0;
		var real_x = argument4 + ((i % argument6) * (argument1 * argument7));
		var real_y = argument5 + (floor(i / argument6) * argument8);
		if (argument0 == spr_pizzelle_hp)
			scr_palette_as_player();
		draw_sprite_ext(argument0, argument9, real_x, real_y, 1, 1, 0, _color, 1);
		pal_swap_reset();
	}
}
