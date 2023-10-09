if (Checkpointactivated == 0)
{
	with (obj_checkpoint)
		Checkpointactivated = false;
	Checkpointactivated = true;
	scr_sound(sfx_checkpoint)
}
