function do_taunt()
{
	if (key_taunt2)
	{
		taunttimer = 20;
		scr_taunt_storeVariables();
		state = states.backbreaker;
		if (supertauntcharged == 1 && key_up && tauntStored.state != states.trick)
		{
			scr_sound(sound_supertaunt1);
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
			if (global.panic = 1 && global.exitgatetaunt < 10 && place_meeting(x, y, obj_exitgate))
			{
				create_small_number(x, y, "250");
				global.collect += 250
				global.exitgatetaunt++
			}
		}
		else
		{
			image_index = irandom_range(0, sprite_get_number(spr_taunt));
			sprite_index = spr_taunt;
			if tauntStored.state == states.trick
			{
				image_index = 0;
				sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
				global.collect += (15 + (trickcount * 5))
				trickcount++
			}
			else
			if (global.panic = 1 && global.exitgatetaunt < 10 && place_meeting(x, y, obj_exitgate))
			{
				create_small_number(x, y, "25");
				global.collect += 25
				global.exitgatetaunt++
			}
		}
		instance_create(x, y, obj_taunteffect);
		with (obj_baddie)
		{
			if (point_in_rectangle(x, y, obj_player.x - 480, obj_player.y - 270, obj_player.x + 480, obj_player.y + 270))
				tauntBuffer = true;
		}
	}
}
function do_grab()
{
	if (key_attack2 && !key_down && !suplexmove && shotgunAnim == 0)
	{
		if (global.treat)
		{
			if (state == states.crouch || state == states.normal)
			{
				if (move == 0)
					movespeed = 0;
			}
			else
				vsp = -3;
			state = states.donut;
			image_index = 0;
			sprite_index = spr_throwDonut;
			with (instance_create(x, y + 25, obj_donutShitted))
			{
				var _angle = (other.xscale > 0 ? 0 : 180);
				Hmovespeed = lengthdir_x(20, _angle);
				Vmovespeed = lengthdir_y(20, _angle);
				shattedBy = other.id;
			}
		}
		else if (!key_up)
		{
			if global.attackmove == 2
			{
				scr_sound(sound_suplex1)
				sprite_index = spr_shoulder
				if (movespeed < 8)
					movespeed = 8;
				state = states.shoulder
				flash = 1;
				instance_create(x, y, obj_crazyrunothereffect);
				if (!instance_exists(obj_superdashcloud) && grounded)
					instance_create(x, y, obj_superdashcloud, 
					{
						obj_player: id
					});
				p1Vibration(30, 5);
				image_index = 0;
			}
			else if ((character == "N" && global.attackmove == 0) || (global.attackmove == 3))
			{
				scr_sound(sfx_kungfuair);
				if (movespeed < 9)
					movespeed = 9;
				airkung = 0;
				kungtime = 30;
				state = states.pizzano_kungfu;
				flash = 1;
				if (!grounded)
				{
					airkung = 1;
					sprite_index = choose(spr_kungfuair1start, spr_kungfuair2start, spr_kungfuair3start);
				}
				else
					sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3, spr_kungfu4, spr_kungfu5, spr_kungfu6);
				instance_create(x, y, obj_crazyrunothereffect);
				if (!instance_exists(obj_superdashcloud) && grounded)
					instance_create(x, y, obj_superdashcloud, 
					{
						obj_player: id
					});
				p1Vibration(30, 5);
				image_index = 0;
			}
			else if character == "PT"
			{
				state = states.punch
				sprite_index = spr_noise_spin
				image_index = 0
				if movespeed < 10
				movespeed = 10
				scr_sound(sound_suplex1)
				scr_sound(sound_throw)
					instance_create(x, y, obj_jumpdust);
						image_index = 0;
			}
			else if ((character != "G" && character != "C" && character != "V" && character != "M" && character != "RM" && character != "GB" && character != "PT") || global.attackmove == 1)
			{
				scr_sound(sound_suplex1);
				instance_create(x, y, obj_slaphitbox);
				suplexmove = 1;
				vsp = 0;
				instance_create(x, y, obj_jumpdust);
				image_index = 0;
				sprite_index = spr_suplexdash;
				if (state == states.normal || state == states.jump)
					movespeed = 8;
				else if (movespeed < 5)
					movespeed = 5;
				state = 17;
			}
		}
		else if (key_up)
			do_uppercut();
	}
}
function do_uppercut()
{
	movespeed = hsp;
	vsp = -10;
	if (grounded)
		vsp = -14;
	state = states.uppercut;
	suplexmove = true;
	sprite_index = spr_uppercutbegin;
	image_index = 0;
	scr_sound(sound_jump);
	scr_sound(sound_rollgetup);
	scr_sound(sound_suplex1);
	with (instance_create(x, y, obj_cloudeffect))
		sprite_index = spr_tornadocloud;
}
