function scr_enemy_throw()
{
	sprite_index = spr_throw;
	if (object_index == obj_fizz || object_index == obj_conedrone)
		vsp = 0;
	if (place_meeting(x, y + 1, obj_railh))
		hsp = -5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = 5;
	else if (!grounded)
		hsp = approach(hsp, 0, 0.1);
	else
		hsp = 0;
	if (animation_end())
	{
		switch (object_index)
		{
			case obj_fizz:
			case obj_froth:
			case obj_conedrone:
				state = enemystates.float;
				sprite_index = walkspr;
				break;
			default:
				state = enemystates.walk;
				sprite_index = walkspr;
				break;
		}
	}
	if (bombreset <= 0 && floor(image_index) >= throw_frame)
	{
		bombreset = 100;
		sprite_index = spr_throw;
		switch (object_index)
		{
			case obj_gumslime:
				bombreset = 200;
				scr_sound(sfx_gumspit);
				with (instance_create(x + (image_xscale * 6), y - 6, obj_gumslime_proj))
				{
					image_xscale = other.image_xscale;
					movespeed = 5;
					vsp = -8;
				}
				break;
			case obj_honeyslime:
				bombreset = 200;
				scr_sound(sfx_gumspit);
				with (instance_create(x + (image_xscale * 6), y - 6, obj_sludge))
				{
					image_xscale = other.image_xscale;
					movespeed = 5;
					vsp = -8;
				}
				break;
			case obj_spitwad:
				bombreset = 200;
				scr_sound(sfx_gumspit);
				with (instance_create(x + (image_xscale * 6), y - 6, obj_gumslime_proj))
				{
					image_xscale = other.image_xscale;
					movespeed = 5;
					vsp = -8;
				}
				break;
			case obj_googlyjuice:
				bombreset = 400;
				scr_sound(sfx_glassbreak);
				with (instance_create(x, y, obj_puddle))
				{
					image_xscale = sign(other.image_xscale);
					vsp -= 12;
					hsp = 2;
					grounded = 0;
				}
				with (instance_create(x, y, obj_puddle))
				{
					image_xscale = -sign(other.image_xscale);
					vsp -= 12;
					hsp = -2;
					grounded = 0;
				}
				break;
			case obj_gumballmachine:
				bombreset = 500;
				scr_sound(sfx_gumballmachine);
				with (instance_create(x + (image_xscale * 6), y - 6, obj_gumball))
				{
					image_xscale = other.image_xscale;
					hsp = other.image_xscale * 5;
					vsp = -4;
				}
				break;
			case obj_cottonwitch:
				bombreset = 400;
				scr_sound(sfx_cottonthrow);
				if (!painter && important)
				{
					with (instance_create(x, y, obj_cottonwitchprojectile))
						image_xscale = other.image_xscale;
				}
				else
				{
					with (instance_create(x, y, obj_paintwitchproj))
						image_xscale = other.image_xscale;
				}
				break;
			case obj_guard:
			case obj_flyingguard:
				scr_sound(sfx_whistle);
				scr_sound(sfx_guardalarm);
				if (object_index != obj_flyingguard)
					vsp = -9;
				alarmed = true;
				global.martian_alarmed = true;
				with (obj_baddie)
				{
					if (id != other.id)
					{
						vsp = -4;
						if (object_index != obj_googlyjuice && object_index != obj_fizz)
							paletteselect = 1;
						elite = true;
						eliteHP = max(1, eliteHP);
					}
					instance_create(x, y - 50, obj_noticeeffect);
				}
				break;
			case obj_popcornbag:
				bombreset = 400;
				instance_destroy(butterID);
				scr_sound(sound_enemythrow);
				with (instance_create(x, y, obj_hotbutter))
				{
					vsp -= 12;
					hsp = -other.image_xscale * 2;
					grounded = 0;
					other.butterID = id;
				}
				break;
			case obj_mintsplosion:
				bombreset = 200;
				if (!audio_is_playing(sfx_robotshoot))
					scr_sound(sfx_robotshoot);
				with (instance_create(x, y + 10, obj_mintsplosion_bomb))
				{
					image_xscale = other.image_xscale;
					movespeed = 8;
				}
				break;
			case obj_icescreamer:
				bombreset = 300;
				hsp = image_xscale * -8;
				with (instance_create(x, y, obj_icescreamer_cone))
					image_xscale = other.image_xscale;
				scr_sound(sfx_robotshoot);
				break;
			case obj_eskimo:
				bombreset = 400;
				scr_sound(sfx_eskimothrow);
				with (instance_create(x, y, obj_eskimoprojectile))
					image_xscale = other.image_xscale;
				break;
			case obj_fizz:
				bombreset = 300;
				if (!audio_is_playing(sfx_thunderspawn))
					scr_sound(sfx_thunderspawn);
				with (instance_create(x, y, obj_thundercloudprojectile))
					image_xscale = other.image_xscale;
				break;
			case obj_conedrone:
				bombreset = 300;
				scr_sound(sfx_robotshoot);
				instance_create(x, y, obj_conedroneprojectile);
				break;
			case obj_beesoldier:
				bombreset = 500;
				scr_sound(sfx_robotshoot);
				instance_create(x, y, obj_beemissile);
				break;
			case obj_crackerkicker:
				if (!audio_is_playing(sound_enemythrow))
					scr_sound(sound_enemythrow);
				instance_create(x + (image_xscale * 50), y, obj_crackerkicker_kickhitbox, 
				{
					image_xscale: image_xscale,
					baddieID: id
				});
				bombreset = 200;
				break;
		}
	}
}
