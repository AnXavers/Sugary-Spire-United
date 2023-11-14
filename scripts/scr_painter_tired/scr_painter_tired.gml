function scr_painter_tired()
{
	hsp = approach(hsp, 0, 0.075);
	vsp += grav;
	atktimer--;
	if (atktimer <= 0)
	{
		sprite_index = spr_painter_idle;
		state = painterstates.normal;
		image_index = 0;
		movespeed = 0;
		boss_attack_queue(painterstates.lunge, 75);
		boss_attack_queue(painterstates.lunge, 75);
		boss_attack_queue(painterstates.lunge, 75);
		boss_attack_queue(painterstates.lunge, 125);
		boss_attack_queue(painterstates.paintball, 75);
	}
	if (place_meeting(x, y, obj_slaphitbox))
	{
		state = painterstates.grabbed;
		with (obj_player)
		{
			xscale *= -1;
			state = states.finishingblow;
			image_index = 0;
			sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
		}
	}
}
