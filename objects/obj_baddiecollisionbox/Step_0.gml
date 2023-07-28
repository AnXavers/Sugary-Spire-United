var bID = baddieID;
if (!instance_exists(baddieID))
	instance_destroy();
if (instance_exists(baddieID))
{
	x = baddieID.x;
	y = baddieID.y;
	image_xscale = baddieID.image_xscale;
}
if (instance_exists(baddieID) && !baddieID.invincible && place_meeting(x, y, obj_player) && obj_player.cutscene == 0 && obj_player.state != 73)
{
	if (baddieID.state != 8)
	{
		with (obj_player)
		{
			if (instakillmove == 1 && other.baddieID.invtime <= 0)
			{
				var angle = point_direction(other.baddieID.x, other.baddieID.y, x + hsp, y + vsp);
				var ymovespeed = 2 + abs(vsp);
				var vdirection = sign(round(hsp + (xscale / 2)));
				scr_sound(sound_punch);
				scr_sleep();
				other.baddieID.initialvsp = clamp(-lengthdir_y(ymovespeed, angle) - 2, -25, random_range(-1, -15));
				other.baddieID.initialhsp = vdirection * (random_range(1, 7) + abs(floor(hsp * 1.2)));
				with (instance_create(x, y, obj_bangeffect))
					sprite_index = spr_enemypuncheffect;
				global.hit += 1;
				global.combotime = 60;
				if (x != bID.x)
					bID.image_xscale = sign(bID.x - x);
				else
					bID.image_xscale = -xscale;
				other.baddieID.hsp = image_xscale * abs(obj_player.hsp);
				other.baddieID.vsp = -10;
				other.baddieID.sprite_index = bID.deadspr;
				other.baddieID.flash = true;
				other.baddieID.state = 6;
				bID.stunned = 200;
				other.baddieID.invtime = 20;
				other.baddieID.throw_hit = 1;
				other.baddieID.setfordeath = 1;
				camera_shake(3, 3);
				repeat (3)
					instance_create(x, y, obj_slapstar);
				if (!grounded && state != 74 && key_jump2)
				{
					suplexmove = 0;
					vsp = -11;
				}
				if (state == 106 || state == 142)
				{
					if (bID.hsp < obj_player.hsp)
						bID.hsp = obj_player.hsp;
					bID.hsp++;
					bID.vsp = -5;
					bID.invtime = 10;
					bID.thrown = true;
					bID.setfordeath = false;
				}
				if (vsp < 0)
				{
					other.baddieID.squashedx = true;
					other.baddieID.squashvalx = 1;
				}
				else
				{
					other.baddieID.squashedy = true;
					other.baddieID.squashvaly = 1;
				}
			}
			if (state == 98 && movespeed <= 8)
			{
				if (!audio_is_playing(sound_bump))
					scr_sound(sound_bump);
				other.baddieID.stuntouch = 50;
				other.baddieID.state = 6;
				if (other.baddieID.stunned < 100)
					other.baddieID.stunned = 100;
				other.baddieID.image_xscale = -xscale;
				other.baddieID.hsp = -other.baddieID.image_xscale * 5;
				other.baddieID.vsp = -4;
			}
			if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_eyescream && y < other.baddieID.y && attacking == 0 && state == 60 && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
			{
				scr_sound(sound_enemyslap);
				suplexmove = 0;
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit += 1;
				if (vsp > 0)
				{
					other.baddieID.squashedx = true;
					other.baddieID.squashvalx = 0;
					other.baddieID.stunned = 200;
					if (x != other.baddieID.x)
						other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					image_index = 0;
					if (key_jump2)
					{
						other.baddieID.vsp = -5;
						other.baddieID.hsp = -other.baddieID.image_xscale * 3;
						instance_create(x, y + 50, obj_stompeffect);
						other.baddieID.state = 6;
						stompAnim = 1;
						other.baddieID.image_index = 0;
						vsp = -14;
						sprite_index = spr_stompprep;
					}
					else
					{
						other.baddieID.vsp = -5;
						other.baddieID.hsp = -other.baddieID.image_xscale * 3;
						instance_create(x, y + 50, obj_stompeffect);
						other.baddieID.state = 6;
						stompAnim = 1;
						other.baddieID.image_index = 0;
						vsp = -9;
						sprite_index = spr_stompprep;
					}
				}
			}
			if (instance_exists(other.baddieID) && (state == 88 && sprite_index == spr_cotton_attack))
			{
				with (other.baddieID)
				{
					cottoned = true;
					alarm[2] = 1;
					instance_create(x, y, obj_bangeffect);
					scr_sound(sound_slaphit);
					hp = 0;
					thrown = true;
					hsp = obj_player.xscale * 20;
					vsp = -6;
					state = 6;
					stunned = 500;
				}
			}
			if (instance_exists(other.baddieID) && state == 68)
			{
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit += 1;
				global.hit += 1;
				global.combotime = 60;
				instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
				instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
				other.baddieID.flash = 1;
				other.baddieID.hp = 0;
				scr_sound(sound_enemystomp);
				instance_create(x, y, obj_bumpeffect);
				other.baddieID.stunned = 200;
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				other.baddieID.vsp = -5;
				other.baddieID.hsp = -other.baddieID.image_xscale * 5;
				hsp = -xscale * 4;
				vsp = -4;
				machpunchAnim = true;
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				other.baddieID.state = 6;
				image_index = 0;
				sprite_index = spr_canehit;
				state = 57;
				if (other.baddieID.hp == 0 && other.baddieID.object_index != obj_boss)
				{
					instance_destroy(other.id);
					instance_destroy(other.baddieID);
				}
				else if (other.baddieID.hp <= 0 && other.baddieID.object_index == obj_boss)
				{
					other.baddieID.thrown = 1;
					vsp = -5;
				}
			}
			if (instance_exists(other.baddieID) && !other.baddieID.throw_hit && bID.invtime <= 0 && (state == 69 || state == 31 || state == 104 || state == 121) && attacking && !instakillmove && other.baddieID.grounded == 1)
			{
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit += 1;
				global.hit += 1;
				global.combotime = 60;
				instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
				instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
				bID.invtime = 10;
				scr_sound(sound_enemystomp);
				instance_create(x, y, obj_bumpeffect);
				if (x != bID.x)
					bID.image_xscale = sign(bID.x - x);
				else
					bID.image_xscale = -xscale;
				other.baddieID.vsp = (y - 180 - other.baddieID.y) / 60;
				other.baddieID.hsp = image_xscale * 12;
				other.baddieID.squashedx = true;
				other.baddieID.squashvalx = 0;
				other.baddieID.image_index = 0;
				machpunchAnim = true;
				other.baddieID.stunned = 200;
				other.baddieID.state = 6;
				bID.invtime = 5;
				if (!grounded && state != 74 && key_jump2)
				{
					suplexmove = 0;
					sprite_index = spr_mach2jump;
					vsp = -11;
				}
			}
			if (instance_exists(other.baddieID) && state == 107 && other.baddieID.state != 8 && other.baddieID.invtime <= 0)
			{
				global.combotime = 60;
				instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
				instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
				instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect);
				with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
					sprite_index = spr_enemypuncheffect;
				other.baddieID.sprite_index = other.baddieID.deadspr;
				other.baddieID.vsp = -5;
				other.baddieID.hsp = xscale * 9;
				other.baddieID.thrown = 1;
				other.baddieID.kunghit = 1;
				other.baddieID.invtime = 120;
				other.baddieID.flash = 1;
				other.baddieID.throw_hit = 1;
				if (!grounded && key_jump2)
				{
					vsp = -12;
					if (kungaircount == 0)
						kungaircount = 1;
				}
				camera_shake(10, 50);
				if (vsp < 0)
				{
					other.baddieID.squashedx = true;
					other.baddieID.squashvalx = 1;
				}
				else
				{
					other.baddieID.squashedy = true;
					other.baddieID.squashvaly = 1;
				}
				scr_sound(sound_punch);
				scr_sound(choose(sound_punch2, sound_punch3));
				other.baddieID.image_index = 0;
				machpunchAnim = true;
				other.baddieID.stunned = 200;
				other.baddieID.state = 6;
			}
			if (instance_exists(other.baddieID) && !other.baddieID.throw_hit && other.baddieID.state != 1 && attacking == 0 && state != 57 && state != 73 && !y < other.baddieID.y && !y > other.baddieID.y && grabbing == 0 && other.baddieID.state != 6 && state != 17 && state != 3)
			{
				if (x != other.baddieID.x)
				{
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					xscale = -sign(x - other.baddieID.x);
				}
				hsp = -xscale * 8;
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit += 1;
				vsp = -4;
				other.baddieID.image_xscale = -xscale;
				other.baddieID.hsp = -other.baddieID.image_xscale * 4;
				other.baddieID.vsp = -4;
				if (other.baddieID.state == 3 || other.baddieID.state == 2)
					other.baddieID.state = 6;
				if (other.baddieID.state == 87)
				{
					stunned = 30;
					other.baddieID.state = 6;
				}
				image_index = 0;
				state = 72;
				if (other.baddieID.state == 96)
					other.baddieID.state = 6;
			}
			if (state == 17 && other.baddieID.object_index != obj_charcherry)
			{
				scr_sound(sound_slaphit);
				baddiegrabbedID = other.baddieID.id;
				with (other.baddieID)
				{
					state = 8;
					instance_create(x + (other.xscale * 40), y, obj_punchdust);
				}
				if (bID.object_index == obj_painter)
				{
					with (bID)
						scr_grab_boss();
				}
				else if (!key_up)
				{
					state = 40;
					sprite_index = spr_player_haulingstart;
					image_index = 0;
				}
				else
				{
					state = 36;
					sprite_index = spr_player_piledriverstart;
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
if (!instance_exists(baddieID))
	instance_destroy();
