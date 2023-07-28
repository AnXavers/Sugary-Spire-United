if (instance_exists(baddieID) && baddieID.state != 8 && baddieID.invtime <= 0)
{
	with (obj_player)
	{
		global.combotime = 60;
		instance_create(other.baddieID.x, other.baddieID.y, obj_slapstar);
		instance_create(other.baddieID.x, other.baddieID.y, obj_baddiegibs);
		instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect);
		with (instance_create(other.baddieID.x, other.baddieID.y, obj_bangeffect))
			sprite_index = spr_enemypuncheffect;
		other.baddieID.sprite_index = other.baddieID.deadspr;
		other.baddieID.vsp = -5;
		other.baddieID.hsp = hsp * 1.2;
		other.baddieID.thrown = 1;
		other.baddieID.kunghit = 1;
		other.baddieID.invtime = 10;
		other.baddieID.flash = 1;
		if (!grounded && key_jump2)
		{
			vsp = -12;
			if (kungaircount == 0)
				kungaircount = 1;
		}
		scr_sleep(300);
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
		jumpstop = 0;
		kungtime += 10;
		other.baddieID.stunned = 200;
		other.baddieID.state = 6;
	}
}
