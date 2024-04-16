function scr_shell_closeconsole()
{
	if (instance_exists(obj_pause))
	{
		obj_pause.canmove = false;
		obj_pause.alarm[0] = 3;
		obj_pause.key_jump = false;
	}
	if (instance_exists(obj_mainfartselect))
	{
		obj_mainfartselect.abletomove = false;
		obj_mainfartselect.alarm[0] = 3;
	}
	global.shellactivate = false;
}
function scr_fartcommand(argument0 = "BALLS")
{
	switch (argument0)
	{
		case "fart":
		case "poop":
		case "crap":
		case "fard":
		case "shart":
		case "shit":
		case "brap":
			return true;
			break;
	}
}