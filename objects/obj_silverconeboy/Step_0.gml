if (live_call()) return live_result;
speaking = place_meeting(x, y, obj_player);
mytex_x -= 0.5;
mytex_x %= sprite_get_width(mytex);
mytex_y = wave(-5, 5, 5, 20);
propdex += 0.35;
propdex %= 3;
ini_open("silversave.ini")
if ini_read_real("Dialog", "meeting", 0)
{
	text = "So, what do we have here? Someone else in this god forsaken place other than myself? Interesting.";
	if dialogline
		text = "Why are you here, to torment me some more? as if being trapped here for.. whoever knows-long isn't enough. Leave me be, cretin.";
}
ini_close()