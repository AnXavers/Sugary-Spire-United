if (DestroyedBy.object_index == obj_player)
{
	if ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == 60)
	{
		DestroyedBy.vsp = 0;
		instance_destroy();
	}
	else if (place_meeting(x - DestroyedBy.hsp, y, DestroyedBy) && DestroyedBy.state == 17)
	{
		with (DestroyedBy)
		{
			with (other.id)
				instance_destroy();
			hsp = -xscale * 4;
			vsp = -4;
			mach2 = 0;
			image_index = 0;
			if (state != 68)
				sprite_index = choose(spr_player_blockbreak1, spr_player_blockbreak2, spr_player_blockbreak3, spr_player_blockbreak4, spr_player_blockbreak5, spr_player_blockbreak6, spr_player_blockbreak7);
			else
				sprite_index = spr_canehit;
			state = 57;
		}
	}
	else
	{
		with (DestroyedBy)
		{
			if (state == 74 || state == 75)
			{
				state = 75;
				sprite_index = spr_bodyslamland;
				image_index = 0;
			}
			else if (state == 36)
			{
				sprite_index = spr_piledriverland;
				scr_sound(sound_maximumspeedland);
				jumpAnim = 1;
				jumpstop = 0;
				image_index = 0;
				with (obj_camera)
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				hsp = 0;
				bounce = 0;
				with (instance_create(x, y + 35, obj_bangeffect))
					xscale = obj_player.xscale;
				instance_create(x, y, obj_landcloud);
				freefallstart = 0;
				with (obj_baddie)
				{
					if (bbox_in_camera(view_camera[0]) && grounded)
					{
						image_index = 0;
						vsp = -7;
						hsp = 0;
					}
				}
				if (instance_exists(baddiegrabbedID))
				{
					with (baddiegrabbedID)
					{
						scr_sound(sound_killingblow);
						instance_create(x, y, obj_slapstar);
						instance_create(x, y, obj_baddiegibs);
						flash = 1;
						global.combotime = 60;
						global.hit += 1;
						alarm[1] = 5;
						thrown = 1;
						x = obj_player.x;
						y = obj_player.y;
						hsp = other.xscale * 10;
						vsp = -10;
						hp = 0;
						thrown = true;
						state = 6;
						if (object_index == obj_painter)
						{
							state = bossstates.hurt;
							movespeed = abs(hsp);
						}
						stunned = 500;
					}
				}
			}
		}
		instance_destroy();
	}
}
else if (DestroyedBy.object_index == obj_donutShitted)
{
	if (!DestroyedBy.bigShot)
		instance_destroy(DestroyedBy);
	instance_destroy();
}
else
	instance_destroy();
