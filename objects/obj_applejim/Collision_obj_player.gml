if (obj_player.state == 17 && state != 6 && state != 17)
{
	state = 6;
	obj_player.state = states.normal;
	hp--;
	stunned = 100;
}
if (state == 17)
{
	with (obj_player)
	{
		if (state == 6 || state == 8)
		{
			scr_sound(mu_swampsecret);
			obj_player.grav = 0.5;
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			instance_create(x, y, obj_slimedebris);
			if (x != other.x)
				obj_player.hsp = sign(x - other.x) * 5;
			else
				obj_player.hsp = 5;
			vsp = -3;
			image_index = 0;
			obj_player.image_index = 0;
			obj_player.flash = 1;
			state = states.bump;
		}
		else if (state != states.hurt && hurted == 0 && cutscene == 0 && state != states.bump)
		{
			scr_sound(sfx_coneboyswallow);
			global.hurtcounter++;
			alarm[8] = 60;
			alarm[7] = 120;
			hurted = 1;
			if (xscale == other.image_xscale)
				sprite_index = spr_hurtjump;
			else
				sprite_index = spr_pizzelle_hurt;
			movespeed = 8;
			vsp = -5;
			timeuntilhpback = 300;
			if (global.collect > 100)
				global.collect -= 100;
			else
				global.collect = 0;
			if (global.collect != 0)
			{
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
			}
			instance_create(x, y, obj_spikehurteffect);
			state = states.hurt;
			if global.newvoicelines
				scr_sound(choose(sfx_newhurt1p, sfx_newhurt2p))
			image_index = 0;
			flash = 1;
		}
	}
}
