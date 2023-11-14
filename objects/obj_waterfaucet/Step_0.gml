if ((sprite_index == spr_onoffswitch_bluetored || sprite_index == spr_onoffswitch_redtoblue) && floor(image_index) >= (image_number - 1))
{
	if (sprite_index == spr_onoffswitch_bluetored)
		sprite_index = spr_onoffswitch_red;
	else
		sprite_index = spr_onoffswitch_blue;
}
if (obj_player.state == 17 && place_meeting(x, y, obj_player))
{
	with obj_player
	{
		if (state == 17)
		{
			sprite_index = spr_faucetpull;
			suplexdashtimer = 7;
			image_index = 0;
			state = states.tackle;
			movespeed = 0.1;
			vsp = -3;
			with (other.id)
			{
				if (sprite_index == spr_onoffswitch_blue)
				{
					timesturned++;
					sprite_index = spr_onoffswitch_bluetored;
				}
				else
				{
					sprite_index = spr_onoffswitch_redtoblue;
					timesturned++;
				}
				scr_sound(sound_switch)
				can_switch = false;
				alarm[0] = 50;
			}
		}
	}
}
if (timesturned >= 10)
{
	instance_destroy();
	instance_create(x, y, obj_bombexplosioncherry);
	audio_stop_sound(sound_switch)
}
