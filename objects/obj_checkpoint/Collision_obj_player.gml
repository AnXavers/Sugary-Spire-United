if (Checkpointactivated == 0)
{
	with (obj_checkpoint)
		Checkpointactivated = false;
	Checkpointactivated = true;
	if object_index != obj_checkpoint_invis
		scr_sound(sfx_checkpoint)
}
