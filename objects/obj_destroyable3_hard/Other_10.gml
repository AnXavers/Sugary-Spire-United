if (DestroyedBy.object_index == obj_player)
{
	if ((place_meeting(x, y - obj_player.vsp, obj_player) || place_meeting(x, y - sign(obj_player.vsp), obj_player)) && obj_player.vsp < 0 && obj_player.state == states.jump)
	{
		obj_player.vsp = 0;
		instance_destroy();
	}
	else if (place_meeting(x - obj_player.hsp, y, obj_player) && obj_player.state == 17)
	{
		with obj_player
		{
			with (other.id)
				instance_destroy();
			hsp = -xscale * 4;
			vsp = -4;
			mach2 = 0;
			image_index = 0;
			if (state != states.mach1)
				sprite_index = choose(spr_blockbreak1, spr_blockbreak2, spr_blockbreak3, spr_blockbreak4, spr_blockbreak5, spr_blockbreak6, spr_blockbreak7);
			else
				sprite_index = spr_canehit;
			state = states.tackle;
		}
	}
	else
	{
		with obj_player
		{
			if (state == states.freefall || state == states.freefallland)
			{
				state = states.freefallland;
				sprite_index = spr_pizzelle_groundpoundland;
				image_index = 0;
			}
			else if (state == states.superslam)
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
					with obj_player.baddiegrabbedID
					{
						scr_sound(sound_killingblow);
						instance_create(x, y, obj_slapstar);
						instance_create(x, y, obj_baddiegibs);
						flash = 1;
						global.combotime = 60;
						global.hit++;
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
