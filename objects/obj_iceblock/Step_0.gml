if (!global.freezeframe)
	invtime = approach(invtime, 0, 1);
if (obj_player.baddiegrabbedID != id && state == enemystates.grabbed)
	state = enemystates.idle;
if (type == "Heavy" && !grounded)
	vsp += 0.2;
if (y > (room_height + 200))
{
	state = enemystates.idle;
	x = xstart;
	y = ystart;
	hsp = 0;
	vsp = 0;
}
switch (state)
{
	case enemystates.idle:
		thrown = false;
		grav = 0.5;
		if (grounded)
			hsp = approach(hsp, 0, 0.3);
		scr_collision();
		break;
	case enemystates.stun:
		if (type == "Fragile" && scr_solid(x + hsp, y + vsp))
			instance_destroy();
		grav = 0.5;
		if (grounded && vsp > 0)
			state = enemystates.idle;
		scr_collision();
		break;
	case enemystates.frozen:
		scr_enemy_frozen();
		break;
}
if (flash == 1 && alarm[1] <= 0)
	alarm[1] = 0.15 * room_speed;
if ((type == "Normal" || type == "Heavy") && ((state == states.frozen && type == "Heavy") || state == enemystates.stun))
{
	instance_destroy(instance_place(x + hsp, y + vsp, obj_baddie));
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_baddie));
	instance_destroy(instance_place(x + hsp, y + vsp, obj_destructibles));
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_destructibles));
	instance_destroy(instance_place(x + hsp, y + vsp, obj_icewall));
	instance_destroy(instance_place(x + sign(hsp), y + sign(vsp), obj_icewall));
}
if (!place_meeting(x, y, obj_dashpad))
	touching = false;
if (!global.freezeframe && place_meeting(x, y, obj_dashpad) && state != enemystates.grabbed && touching == 0)
{
	state = enemystates.stun;
	vsp = -7;
	var _pad = instance_place(x, y, obj_dashpad);
	x = _pad.x;
	y = _pad.y;
	xscale = _pad.image_xscale;
	movespeed = 15;
	other.hsp = other.movespeed * other.xscale;
	other.flash = true;
	touching = true;
}
if (!global.freezeframe && invtime <= 0 && place_meeting(x, y, obj_player) && state != enemystates.grabbed)
{
	with (obj_player)
	{
		if (state == states.mach3 || state == states.mach2 || state == states.pizzano_kungfu || state == states.minecart || state == states.bottlerocket || state == states.machtumble || state == states.pepperman_pinball || state = states.punch || state = states.pogo || state == states.pizzano_rocketfist || state == states.shoulder)
		{
			instance_create(other.x, other.y, obj_slapstar);
			instance_create(other.x, other.y, obj_baddiegibs);
			instance_create(other.x, other.y, obj_bangeffect);
			with (instance_create(other.x, other.y, obj_bangeffect))
				sprite_index = spr_enemypuncheffect;
			machpunchAnim = true;
			other.state = enemystates.stun;
			other.vsp = -11;
			if (state == states.mach2)
				other.vsp = -7;
			other.movespeed = movespeed + 2;
			if (state == states.pogo && !pogochargeactive)
				other.vsp = -7;
			if (state == states.pogo && pogochargeactive)
				other.vsp = -11;
			if (state == states.punch)
			{
				 sprite_index = choose(spr_blockbreak1, spr_blockbreak2, spr_blockbreak3, spr_blockbreak4, spr_blockbreak5, spr_blockbreak6, spr_blockbreak7, spr_punch)
				image_index = 0
				state = states.tackle
				movespeed = 3
				machpunchAnim = true;
				hsp = 2 * xscale
				vsp = -3
				other.thrown = true
				other.vsp = -10;
				other.movespeed = movespeed + 12;
			}
			if (state == states.bottlerocket)
			{
				other.vsp -= 7;
				other.movespeed += 2;
			}
			if place_meeting(x + hsp, y, obj_icewall)
				instance_destroy(instance_nearest(x + hsp, y, obj_icewall))
			other.xscale = xscale;
			other.hsp = other.movespeed * other.xscale;
			other.flash = true;
			other.invtime = 10;
			scr_sound(sound_punch);
			scr_sleep();
		}
		if (state == states.Sjump || state == states.uppercut)
		{
			var pctg = other.x - x;
			instance_create(other.x, other.y, obj_slapstar);
			instance_create(other.x, other.y, obj_baddiegibs);
			instance_create(other.x, other.y, obj_bangeffect);
			with (instance_create(other.x, other.y, obj_bangeffect))
				sprite_index = spr_enemypuncheffect;
			machpunchAnim = true;
			other.state = enemystates.stun;
			other.vsp = vsp;
			if (state == states.Sjump)
				other.vsp -= 8;
			other.movespeed = 7 * (abs(pctg) / 32);
			if (sign(pctg) != 0)
				other.xscale = sign(pctg);
			else
				other.movespeed = 0;
			other.hsp = other.movespeed * other.xscale;
			other.flash = true;
			other.invtime = 20;
			scr_sound(sound_punch);
			scr_sleep();
		}
		if (state == states.handstandjump)
		{
			scr_sound(sound_slaphit);
			baddiegrabbedID = other.id;
			with (other)
			{
				state = enemystates.grabbed;
				instance_create(x + (other.xscale * 40), y, obj_punchdust);
			}
			if (!key_up)
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
