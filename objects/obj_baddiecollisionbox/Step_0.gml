var bID = baddieID;
if (!instance_exists(baddieID))
	instance_destroy();
if (instance_exists(baddieID))
{
	x = baddieID.x;
	y = baddieID.y;
	image_xscale = baddieID.image_xscale;
}
if (instance_exists(baddieID) && !baddieID.invincible && place_meeting(x, y, obj_player) && obj_player.cutscene == 0 && obj_player.state != states.hurt)
{
	if (baddieID.state != enemystates.grabbed)
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
				global.hit++;
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
				if (state == states.mach3 && sprite_index != spr_superjump_cancel && sprite_index != spr_mach3hit && ((character == "P" && global.newplayeranim == 1)) || character == "S")
				{
					sprite_index = spr_mach3hit
					image_index = 0
				}
				if (!grounded && state != states.freefall && key_jump2)
				{
					suplexmove = 0;
					vsp = -11;
				}
				if (state == states.pizzano_kungfu || state == states.frostburnspin)
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
			if (state == states.cottonroll && movespeed <= 8)
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
			if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_eyescream && y < other.baddieID.y && attacking == 0 && state == states.jump && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep)
			{
				scr_sound(sound_enemyslap);
				suplexmove = 0;
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit++;
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
			if (place_meeting(x, (y + 1), other.id) && state == states.pogo && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_noise_pogobounce)
			{
				switch pogochargeactive
				{
					case 0:
						pogospeedprev = 0
						other.baddieID.vsp = -3
						scr_sound(sound_stomp)
						other.baddieID.state = states.stunned
						if (other.baddieID.stunned < 100)
							other.baddieID.stunned = 100
						sprite_index = spr_noise_pogobounce
						break
					case 1:
						pogospeedprev = 0
						instance_destroy(other.baddieID)
						instance_destroy(other.id)
						sprite_index = spr_noise_pogobouncemach
						break
				}

				instance_create(x, (y + 50), obj_stompeffect)
				image_index = 0
				movespeed = 0
				vsp = 0
			}
			if (instance_exists(other.baddieID) && state == states.punch)
			{
				sprite_index = choose(spr_blockbreak1, spr_blockbreak2, spr_blockbreak3, spr_blockbreak4, spr_blockbreak5, spr_blockbreak6, spr_blockbreak7, spr_punch)
				image_index = 0
				state = states.tackle
				movespeed = 3
				hsp = 2 * xscale
				vsp = -3
				if instance_exists(other.baddieID)
				{
					with (other.baddieID)
					{
						instance_create(x, y, obj_slapstar)
						instance_create(x, y, obj_slapstar)
						instance_create(x, y, obj_slapstar)
						instance_create(x, y, obj_baddiegibs)
						instance_create(x, y, obj_baddiegibs)
						instance_create(x, y, obj_baddiegibs)
						alarm[2] = 1;
						instance_create(x, y, obj_bangeffect);
						scr_sound(sound_slaphit);
						hp = 0;
						thrown = true;
						hsp = obj_player.xscale * 20;
						vsp = -6;
						state = 6;
						stunned = 1000;
						throw_hit = 1
						with (obj_camera)
						{
							shake_mag = 3
							shake_mag_acc = (3 / room_speed)
						}
						alarm[3] = 3
						global.hit += 1
						global.combotime = 60
						alarm[2] = 1;
					}
				}
				other.baddieID.hsp = (xscale * 25)
				other.baddieID.vsp = -6
			}
			if (instance_exists(other.baddieID) && state == states.handstandjump && character == "C" && substate = 1)
			{
				image_index = 0
				state = states.tackle
				hsp = 4 * -xscale
				vsp = -6
				if instance_exists(other.baddieID)
				{
					with (other.baddieID)
					{
						instance_create(x, y, obj_slapstar)
						instance_create(x, y, obj_slapstar)
						instance_create(x, y, obj_slapstar)
						instance_create(x, y, obj_baddiegibs)
						instance_create(x, y, obj_baddiegibs)
						instance_create(x, y, obj_baddiegibs)
						alarm[2] = 1;
						instance_create(x, y, obj_bangeffect);
						scr_sound(sound_slaphit);
						hp = 0;
						thrown = true;
						hsp = obj_player.xscale * 20;
						vsp = -6;
						state = 6;
						stunned = 1000;
						throw_hit = 1
						with (obj_camera)
						{
							shake_mag = 3
							shake_mag_acc = (3 / room_speed)
						}
						alarm[3] = 3
						global.hit += 1
						global.combotime = 60
						alarm[2] = 1;
					}
				}
				if !key_up
				{
					sprite_index = spr_canehit
					if floor(image_index) >= 2
					{
					other.baddieID.hsp = (xscale * 25)
					other.baddieID.vsp = -6
					}
				}
				else
				{
				sprite_index = spr_coneboy_sword_attackup
				other.baddieID.hsp = 2
				other.baddieID.vsp = -10
				}
			}
			if (instance_exists(other.baddieID) && (state == states.cotton && sprite_index == spr_cotton_attack))
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
			if (instance_exists(other.baddieID) && (state == states.cottonbounce))
			{
			cottonsize += 1
				with (other.baddieID)
				{
					global.hit++;
					global.combotime = 60;
					instance_create(x, y, obj_slapstar);
					instance_create(x, y, obj_baddiegibs);
					instance_create(x, y, obj_bangeffect);
					scr_sound(sound_slaphit);
					hp = 0;
					thrown = true
					hsp = 0
					vsp = 0
					state = 6;
					stunned = 500;
				}
			}
			if (instance_exists(other.baddieID) && state == states.mach1)
			{
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit++;
				global.hit++;
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
				state = states.tackle;
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
			if (instance_exists(other.baddieID) && !other.baddieID.throw_hit && bID.invtime <= 0 && (state == states.mach2 || state == states.machroll || state == states.pizzano_rocketfist || state == states.pizzano_shoulderbash) && attacking && !instakillmove && other.baddieID.grounded == 1)
			{
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit++;
				global.hit++;
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
				if (!grounded && state != states.freefall && key_jump2)
				{
					suplexmove = 0;
					sprite_index = spr_mach2jump;
					vsp = -11;
				}
			}
			if (instance_exists(other.baddieID) && state == states.pizzano_pummel && other.baddieID.state != 8 && other.baddieID.invtime <= 0)
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
			if (instance_exists(other.baddieID) && !other.baddieID.throw_hit && other.baddieID.state != 1 && attacking == 0 && state != states.tackle && state != states.hurt && !y < other.baddieID.y && !y > other.baddieID.y && grabbing == 0 && other.baddieID.state != 6 && state != 17 && state != 3)
			{
				if (x != other.baddieID.x)
				{
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
					xscale = -sign(x - other.baddieID.x);
				}
				hsp = -xscale * 8;
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit++;
				vsp = -4;
				other.baddieID.image_xscale = -xscale;
				other.baddieID.hsp = -other.baddieID.image_xscale * 4;
				other.baddieID.vsp = -4;
				if (other.baddieID.state == 3 || other.baddieID.state == 2)
					other.baddieID.state = 6;
				if (other.baddieID.state == states.finishingblow)
				{
					stunned = 30;
					other.baddieID.state = 6;
				}
				image_index = 0;
				state = states.bump;
				if (other.baddieID.state == states.tumble)
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
					state = states.grab;
					sprite_index = spr_haulingstart;
					image_index = 0;
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
if (!instance_exists(baddieID))
	instance_destroy();
