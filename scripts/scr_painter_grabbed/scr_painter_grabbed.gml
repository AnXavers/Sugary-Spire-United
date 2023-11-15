function scr_painter_grabbed()
{
	sprite_index = spr_painter_hurt;
	vsp += 0.25;
	hsp = approach(hsp, 0, 0.15);
	if (!hurted)
	{
		x = obj_player.x + (32 * obj_player.xscale);
		y = obj_player.y - 64;
		if (place_meeting(x, y, obj_swordhitbox))
		{
			vsp = -5;
			hsp = 15 * obj_player.xscale;
			hurted = true;
			camera_shake(15, 50);
			atktimer = 75;
		}
	}
	if (hurted)
	{
		if (abs(hsp) <= 0)
		{
			atktimer--;
			if (atktimer <= 0)
			{
				state = states.normal;
				ds_queue_clear(atkqueue);
				if (phase == 1)
				{
					if (obj_bosscontroller.bosshp > 16)
					{
						boss_attack_queue(painterstates.lunge, 75);
						boss_attack_queue(painterstates.lunge, 75);
						boss_attack_queue(painterstates.lunge, 75);
						boss_attack_queue(painterstates.paintball, 125);
					}
					else
					{
						boss_attack_queue(painterstates.lunge, 50);
						boss_attack_queue(painterstates.lunge, 50);
						boss_attack_queue(painterstates.dash, 75);
						boss_attack_queue(painterstates.dash, 75);
						boss_attack_queue(painterstates.paintball, 125);
					}
				}
				if (x >= 480)
					xscale = -1;
				else
					xscale = 1;
			}
		}
		if (scr_solid(x + hsp, y, true))
		{
			xscale *= -1;
			vsp = -5;
			hsp *= -1;
		}
		if (grounded)
			vsp = -5;
	}
}
