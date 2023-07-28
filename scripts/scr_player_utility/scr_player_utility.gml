function do_taunt()
{
	if (key_taunt2)
	{
		taunttimer = 20;
		scr_taunt_storeVariables();
		state = 45;
		if (supertauntcharged == 1 && key_up)
		{
			scr_sound(sound_supertaunt1);
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3);
		}
		else
		{
			image_index = irandom_range(0, sprite_get_number(spr_player_taunt));
			sprite_index = spr_player_taunt;
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
	if (key_slap2 && !key_down && !suplexmove && shotgunAnim == 0)
	{
		if (global.treat)
		{
			if (state == 65 || state == 1)
			{
				if (move == 0)
					movespeed = 0;
			}
			else
				vsp = -3;
			state = 137;
			image_index = 0;
			sprite_index = spr_player_throwDonut;
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
			if (character == "P")
			{
				scr_sound(sound_suplex1);
				instance_create(x, y, obj_slaphitbox);
				suplexmove = 1;
				vsp = 0;
				instance_create(x, y, obj_jumpdust);
				image_index = 0;
				sprite_index = spr_suplexdash;
				if (state == 1 || state == 60)
					movespeed = 8;
				else if (movespeed < 5)
					movespeed = 5;
				state = 17;
			}
			else if (character == "N")
			{
				scr_sound(sfx_kungfuair);
				if (movespeed < 9)
					movespeed = 9;
				airkung = 0;
				kungtime = 30;
				state = 106;
				flash = 1;
				if (!grounded)
				{
					airkung = 1;
					sprite_index = choose(spr_pizzano_kungfuair1start, spr_pizzano_kungfuair2start, spr_pizzano_kungfuair3start);
				}
				else
					sprite_index = choose(spr_pizzano_kungfu1, spr_pizzano_kungfu2, spr_pizzano_kungfu3, spr_pizzano_kungfu4, spr_pizzano_kungfu5);
				instance_create(x, y, obj_crazyrunothereffect);
				if (!instance_exists(obj_superdashcloud) && grounded)
					instance_create(x, y, 451, 
					{
						playerID: id
					});
				p1Vibration(30, 5);
				image_index = 0;
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
	state = 89;
	suplexmove = true;
	sprite_index = spr_player_uppercutbegin;
	image_index = 0;
	scr_sound(sound_jump);
	scr_sound(sound_rollgetup);
	scr_sound(sound_suplex1);
	with (instance_create(x, y, obj_cloudeffect))
		sprite_index = spr_tornadocloud;
}
