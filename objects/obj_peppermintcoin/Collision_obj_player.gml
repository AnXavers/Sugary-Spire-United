if grace <= 0
{
	instance_destroy()
	scr_sound(sound_pizzacoin)
	instance_create(x, y, obj_bumpeffect)
	ini_open(global.fileselect)
	var cointotal = (ini_read_real("Collects", "cointotal", 0) + 1)
	ini_write_real("Collects", "cointotal", cointotal)
	scr_controlprompt(string(cointotal))
	ini_close()
}