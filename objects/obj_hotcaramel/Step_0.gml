if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != states.noclip && !global.freezeframe && (state != states.cookiemount && state != states.cookiemountfireass && state != states.cookiemountattack))
		{
			if (state == states.cotton || state == states.cottondrill)
				instance_create(x, y, obj_poofeffect);
			sprite_index = spr_fireass;
			if global.newplayeranim == 1
				sprite_index = spr_fireassstart
			state = states.fireass;
			image_index = 0;
			vsp = -20;
			audio_stop_sound(obj_player.sfx_fireass);
			scr_sound(obj_player.sfx_fireass);
		}
	}
}
