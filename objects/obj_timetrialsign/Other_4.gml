ini_open(global.fileselect);
timetrialtime = ini_read_string("Ranks", "timetrial", "none");
ini_close();
if (timetrialtime == "none")
	visible = false;
else
	visible = true;
