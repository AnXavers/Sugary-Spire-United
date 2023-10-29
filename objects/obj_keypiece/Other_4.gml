ini_open("silversave.ini")
if ini_read_real("Collects", ID, 0) == 1
	instance_destroy()
ini_close()