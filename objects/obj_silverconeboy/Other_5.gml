ini_open("silversave.ini")
if (ini_read_real("Dialog", "meeting", 1) && dialogline == 4)
	ini_write_real("Dialog", "meeting", 0)
ini_close()