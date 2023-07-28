for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with (b)
	{
		for (var l = 0; l < array_length(alarm); l++)
		{
			if (alarm[l] >= 0 && !global.freezeframe)
				alarm[l]--;
		}
		if (blink)
			visible = global.BlinkTrail;
		if (instance_exists(identity) && identity.object_index == obj_player && !global.freezeframe)
		{
			switch (identity.state)
			{
				case 48:
				case 49:
					var _mvspd = (identity.verticalMovespeed > identity.movespeed) ? identity.verticalMovespeed : identity.movespeed;
					image_alpha = abs(identity.movespeed) / 12;
					break;
				default:
					image_alpha = identity.movespeed / 12;
					break;
			}
		}
		if (instance_exists(identity) && identity.object_index == obj_player && identity.state != 70 && identity.state != 3 && identity.state != 49 && identity.state != 48 && identity.state != 5 && identity.state != 69 && identity.state != 17 && identity.state != 71 && identity.state != 37 && identity.state != 28 && identity.state != 34 && identity.state != 36 && identity.state != 101 && !(identity.state == 31 && identity.sprite_index != identity.spr_crouchslip && identity.movespeed >= 12) && identity.state != 28 && identity.state != 63 && identity.state != 93 && identity.state != 96 && identity.state != 125 && identity.state != 60 && identity.state != 89 && identity.state != 103 && global.cane == 0 && identity.state != 104 && identity.state != 121 && identity.state != 68 && identity.state != 106 && identity.state != 150 && identity.state != 96)
			vanish = true;
		if (vanish)
			gonealpha = approach(gonealpha, 0, 0.15);
		x += hsp;
		y += vsp;
		if (alarm[0] == 0 || !instance_exists(identity))
			vanish = true;
		if (alarm[1] == 0 || gonealpha == 0)
		{
			b = undefined;
			ds_list_delete(global.afterimage_list, i);
			i--;
		}
	}
}
if (!global.freezeframe)
{
	if (blinkingBuffer > 0)
		blinkingBuffer--;
	else
	{
		event_user(0);
		blinkingBuffer = 3;
	}
}
