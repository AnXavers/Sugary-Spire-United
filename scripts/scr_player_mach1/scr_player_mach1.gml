function state_player_mach1()
{
	switch (character)
	{
		case "N":
			sprite_index = spr_mach2;
			if (movespeed < 6)
				movespeed = 6;
			state = states.mach2;
			break;
		default:
			dir = xscale;
			move = key_left + key_right;
			landAnim = 0;
			if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
			{
				mach2 = 0;
				state = states.normal;
				movespeed = 0;
			}
			if (movespeed <= 8)
				movespeed += 0.5;
			machhitAnim = 0;
			crouchslideAnim = 1;
			if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
				hsp = xscale * movespeed;
			else if (place_meeting(x, y + 1, obj_railh))
				hsp = (xscale * movespeed) - 5;
			else if (place_meeting(x, y + 1, obj_railh2))
				hsp = (xscale * movespeed) + 5;
			if (grounded && xscale == 1 && move == -1)
			{
				momemtum = 0;
				mach2 = 0;
				movespeed = 0;
				image_index = 0;
				xscale = -1;
			}
			if (grounded && xscale == -1 && move == 1)
			{
				momemtum = 0;
				mach2 = 0;
				movespeed = 0;
				image_index = 0;
				xscale = 1;
			}
			if (grounded)
			{
				if (mach2 < 35)
					mach2++;
				if (mach2 >= 35)
				{
					charged = 0;
					movespeed = 10;
					state = states.mach2;
					instance_create(x, y, obj_jumpdust);
				}
			}
			sprite_index = spr_mach1;
			if (!grounded)
			{
				sprite_index = spr_airdash1;
				momemtum = 1;
				state = states.jump;
				jumpAnim = 0;
				image_index = 0;
			}
			if (!key_sprint && grounded)
			{
				state = states.normal;
				image_index = 0;
				mach2 = 0;
			}
			if (key_down)
			{
				sprite_index = spr_crouchslip;
				state = states.crouchslide;
				mach2 = 0;
			}
			image_speed = 0.45;
			if (key_jump && grounded && key_sprint)
			{
				scr_sound(sound_jump);
				sprite_index = spr_airdash1;
				dir = xscale;
				momemtum = 1;
				vsp = -11;
				movespeed += 2;
				state = states.jump;
				jumpAnim = 1;
				image_index = 0;
			}
			if (!instance_exists(obj_dashcloud) && grounded)
				instance_create(x, y, obj_dashcloud);
			if (key_taunt2)
			{
				taunttimer = 20;
				scr_taunt_storeVariables();
				state = states.backbreaker;
				if (supertauntcharged == 1 && key_up)
				{
					image_index = 0;
					sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
				}
				else
				{
					image_index = irandom(sprite_get_number(spr_taunt));
					sprite_index = spr_taunt;
				}
				instance_create(x, y, obj_taunteffect);
			}
			if (key_attack2 && !key_down && suplexmove == 0 && shotgunAnim == 0 && global.cane != 1)
			{
				scr_sound(sound_suplex1);
				instance_create(x, y, obj_slaphitbox);
				suplexmove = 1;
				vsp = 0;
				instance_create(x, y, obj_jumpdust);
				image_index = 0;
				sprite_index = spr_suplexdash;
				state = 17;
			}
			break;
	}
}
