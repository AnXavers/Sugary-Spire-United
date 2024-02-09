function scr_coneboy_copyabilities()
{
	if (character == "C")
	{
		if (substate == 1)
		{
			if (sprite_index == spr_pizzelle_idle || sprite_index == spr_idle2 || sprite_index == spr_idle3)
				sprite_index = spr_coneboy_sword_idle;
			if (key_up && key_attack2)
			{
				vsp = grounded ? -15 : -7
				state = states.uppercut;
				suplexmove = true;
				sprite_index = spr_coneboy_sworduppercut;
				instance_create(x, y, obj_coneboyswordhitbox);
			}
			if (key_sprint && grounded)
			{
				instance_create(x, y, obj_coneboyswordhitbox);
				sprite_index = spr_coneboy_sworddash;
				state = states.coneboy_inhale115;
			}
			if key_attack2 && !key_up
			{
				if movespeed < 10
				movespeed = 10
				state = states.handstandjump;
				suplexmove = true;
				sprite_index = spr_pizzelle_canesuplex
				image_index = 0
				instance_create(x, y, obj_coneboyswordhitbox);
			}
		}
		if (substate == 2)
		{
			if (key_shoot2 && instance_number(obj_coneboyjuice) < 3)
			{
				image_index = 0;
				sprite_index = spr_coneboy_juicespit;
				state = states.coneboy_kick;
				instance_create(x, y, obj_coneboyjuice);
			}
			if (key_sprint && grounded)
			{
				sprite_index = spr_coneboy_juicewave;
				state = states.coneboy_inhale115;
				movespeed = 6;
			}
		}
		if (substate == 3)
		{
			if key_attack2 && !key_up && grounded
			{
		state = states.coneboy_inhale115;
		sprite_index = spr_coneboy_chargestart
		image_index = 0
		movespeed = 8
		flash = true
			}
		}
		if (substate == 4)
	{
		if key_attack2
		{
		shoulderbuffer = 125
		state = states.cottonbash
		sprite_index = spr_coneboy_cottonbash
		image_index = 0
			if movespeed < 8
			movespeed = 8
		flash = 1;
		instance_create(x, y, obj_crazyrunothereffect)
		}
	}
	}
}