if ((sprite_index == spr_onoffswitch_bluetored || sprite_index == spr_onoffswitch_redtoblue) && floor(image_index) >= (image_number - 1))
{
	if (sprite_index == spr_onoffswitch_bluetored)
		sprite_index = spr_onoffswitch_red;
	else
		sprite_index = spr_onoffswitch_blue;
}
var player = instance_nearest(x, y, obj_player);
player = obj_player;
if (player.state == 17 && place_meeting(x, y, player))
{
	with (player)
	{
		if (state == 17)
		{
			sprite_index = spr_player_faucetpull;
			suplexdashtimer = 7;
			image_index = 0;
			state = 57;
			movespeed = 0.1;
			vsp = -3;
			with (other.id)
			{
				if (sprite_index == spr_onoffswitch_blue)
				{
					timesturned += 1;
					sprite_index = spr_onoffswitch_bluetored;
				}
				else
				{
					sprite_index = spr_onoffswitch_redtoblue;
					timesturned += 1;
				}
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
}
