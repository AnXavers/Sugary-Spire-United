function scr_hatScript()
{
	ini_open("saveData.ini");
	var entryway = ini_read_string("Ranks", "entryway", "none");
	var steamy = ini_read_string("Ranks", "steamy", "none");
	var molasses = ini_read_string("Ranks", "molasses", "none");
	var mines = ini_read_string("Ranks", "mines", "none");
	if (ini_read_real("HatsUnlock", "Entryway", false) == 0 && entryway == "s")
		ini_write_real("HatsUnlock", "Entryway", true);
	if (ini_read_real("HatsUnlock", "Cottontown", false) == 0 && steamy == "s")
		ini_write_real("HatsUnlock", "Cottontown", true);
	if (ini_read_real("HatsUnlock", "Molasses", false) == 0 && molasses == "s")
		ini_write_real("HatsUnlock", "Molasses", true);
	if (ini_read_real("HatsUnlock", "Mines", false) == 0 && mines == "s")
		ini_write_real("HatsUnlock", "Mines", true);
	if (ini_read_real("HatsUnlock", "World1", false) == 0 && (entryway != "none" && steamy != "none" && molasses != "none" && mines != "none"))
		ini_write_real("HatsUnlock", "World1", true);
	ini_close();
	ini_open("optionData.ini");
	if (ini_read_real("HatsUnlock", "Entryway", false) == 0 && entryway == "s")
		ini_write_real("HatsUnlock", "Entryway", true);
	if (ini_read_real("HatsUnlock", "Cottontown", false) == 0 && steamy == "s")
		ini_write_real("HatsUnlock", "Cottontown", true);
	if (ini_read_real("HatsUnlock", "Molasses", false) == 0 && molasses == "s")
		ini_write_real("HatsUnlock", "Molasses", true);
	if (ini_read_real("HatsUnlock", "Mines", false) == 0 && mines == "s")
		ini_write_real("HatsUnlock", "Mines", true);
	if (ini_read_real("HatsUnlock", "World1", false) == 0 && (entryway != "none" && steamy != "none" && molasses != "none" && mines != "none"))
		ini_write_real("HatsUnlock", "World1", true);
	ini_close();
}
function scr_normalAchievments()
{
	ini_open("optionData.ini");
	if (global.kungairtime == 0 && kungairtime >= 50)
		global.kungairtime = 1;
	ini_close();
}
