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
		if (instance_exists(obj_player) && !global.freezeframe)
		{
			switch (obj_player.state)
			{
				case states.ufofloat:
				case states.ufodash:
				case states.ufodashOLD:
					var _mvspd = (obj_player.verticalMovespeed > obj_player.movespeed) ? obj_player.verticalMovespeed : obj_player.movespeed;
					image_alpha = abs(obj_player.movespeed) / 12;
					break;
				default:
					image_alpha = obj_player.movespeed / 12;
					break;
			}
		}
		if (instance_exists(obj_player) && obj_player.state != states.mach3 && obj_player.state != 3 && obj_player.state != states.ufodash && obj_player.state != states.ufofloat && obj_player.state != 5 && obj_player.state != states.mach2 && obj_player.state != 17 && obj_player.state != states.machslide && obj_player.state != states.slam && obj_player.state != states.chainsaw && obj_player.state != states.machfreefall && obj_player.state != states.superslam && obj_player.state != states.minecart && !(obj_player.state == states.machroll && obj_player.sprite_index != obj_player.spr_crouchslip && obj_player.movespeed >= 12) && obj_player.state != states.chainsaw && obj_player.state != states.Sjump && obj_player.state != states.parry && obj_player.state != states.tumble && obj_player.state != states.flushed && obj_player.state != states.jump && obj_player.state != states.uppercut && obj_player.state != states.machtumble && global.cane == 0 && obj_player.state != states.pizzano_rocketfist && obj_player.state != states.pizzano_shoulderbash && obj_player.state != states.mach1 && obj_player.state != states.pizzano_kungfu && obj_player.state != states.rupertjump && obj_player.state != states.tumble)
			vanish = true;
		if (vanish)
			gonealpha = approach(gonealpha, 0, 0.15);
		x += hsp;
		y += vsp;
		if (alarm[0] == 0 || !instance_exists(obj_player))
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
