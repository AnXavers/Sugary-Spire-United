function blend_start()
{
	if event_type == ev_draw
	{
		if event_number == 0
		{
			gpu_set_blendmode(bm_add);
		}
	}
}
function blend_end()
{
	if event_type == ev_draw
	{
		if event_number == 0
		{
			gpu_set_blendmode(bm_normal);
		}
	}
}