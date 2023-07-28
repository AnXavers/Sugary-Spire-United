hookStopID = instance_nearest(x, y, obj_hookstop);
if (!instance_exists(hookStopID))
{
	show_debug_message("Hook didn't find stop");
	instance_destroy();
}
