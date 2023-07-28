function scr_painter_normal()
{
	hsp = 0;
	movespeed = 0;
	vsp += grav;
	image_speed = 0.35;
	sprite_index = spr_painter_idle;
	hurted = false;
	if (atk)
		atktimer--;
	if (atktimer <= 0)
	{
		if (ds_exists(atkqueue, 4))
		{
			state = ds_queue_dequeue(atkqueue);
			atktimer = ds_queue_dequeue(atkqueue);
		}
		flash = true;
	}
}
