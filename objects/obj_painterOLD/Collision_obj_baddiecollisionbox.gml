var bID = other.id.baddieID;
if (bID.thrown && state != bossstates.hurt && state != bossstates.parry)
{
	if (!can_parry)
	{
		xscale = face_obj(obj_player);
		movespeed = 12;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_bangeffect);
		with (instance_create(x, y, obj_bangeffect))
			sprite_index = spr_enemypuncheffect;
		sprite_index = hurt_spr;
		vsp = -6;
		flash = true;
		state = bossstates.hurt;
		stunned = 120;
		invtime = 20;
		grav = 0.5;
		scr_sound(sound_punch);
		camera_shake(30, 15);
		scr_sleep(200);
	}
	else
	{
		vsp = 0;
		state = bossstates.parry;
		image_index = 0;
		sprite_index = spr_painter_idle;
	}
}
