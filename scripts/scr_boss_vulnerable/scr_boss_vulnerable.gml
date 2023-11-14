function scr_boss_vunerable()
{
	if (grounded)
	{
		hsp = approach(hsp, 0, 0.1);
		if (vsp > 0)
			hsp = 0;
	}
	movespeed = 0;
	if (sprite_index != hurt_spr)
		sprite_index = vulnerable_spr;
	if (intensity >= 0)
		intensity--;
	else
	{
		sprite_index = normal_spr;
		state = bossstates.normal;
		image_index = 0;
	}
	var p = obj_player;
	if (place_meeting(x, y, p) && p.state != states.hurt)
	{
		var o = id;
		with (p)
		{
			if (instakillmove || state == states.uppercut)
			{
				o.xscale = -xscale;
				o.movespeed = 12;
				instance_create(o.x, o.y, obj_slapstar);
				instance_create(o.x, o.y, obj_baddiegibs);
				instance_create(o.x, o.y, obj_bangeffect);
				with (instance_create(o.x, o.y, obj_bangeffect))
					sprite_index = spr_enemypuncheffect;
				o.sprite_index = o.hurt_spr;
				o.vsp = -12;
				o.flash = true;
				o.state = bossstates.hurt;
				o.stunned = 120;
				o.invtime = 20;
				o.setfordeath = true;
				scr_sound(sound_punch);
				camera_shake(30, 15);
				scr_sleep(700);
			}
			if (state == 17)
			{
				scr_sound(sound_slaphit);
				baddiegrabbedID = o.id;
				with (o)
				{
					state = bossstates.grabbed;
					instance_create(x + (other.xscale * 40), y, obj_punchdust);
				}
				if (!key_up)
				{
					state = states.finishingblow;
					image_index = 0;
					sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
				}
				else
				{
					state = states.superslam;
					sprite_index = spr_piledriverstart;
					if (grounded)
						vsp = -12;
					else
						vsp = -6;
					grounded = false;
					image_index = 0;
					image_speed = 0.35;
				}
			}
		}
	}
}
