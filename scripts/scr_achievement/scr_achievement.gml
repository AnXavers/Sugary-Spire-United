function scr_hatScript()
{
	ini_open(global.fileselect);
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
function scr_normalAchievments(argument0 = global.levelname)
{
	ini_open(global.fileselect);
	if (global.rank = "e" && instance_exists(obj_rank))
		ini_write_real("Achievements", string(global.levelname) + "erank", true);
	switch argument0
	{
		case "entryway":
			if (global.clutterhit == 56)
				ini_write_real("Achievements", "entrywayclutter", true);
			if (global.clutterhit == 30)
				ini_write_real("Achievements", "waferracers", true);
			if (global.clutterhit == 30)
				ini_write_real("Achievements", "entrywayclutter", true);
			break;
		case "steamy":
			break;
		case "molasses":
			break;
		case "mines":
			break;
		case "dragonlair":
			break;
		case "fudge":
			break;
		case "dance":
			break;
		case "estate":
			break;
		case "sucrose":
			break;
		case "bee":
			break;
		case "martian":
			break;
		case "exitway":
			break;
		case "entrance":
			break;
		case "pizzascape":
			break;
		case "ancient":
			break;
		case "bloodsauce":
			break;
		case "finale":
			break;
		case "yogurt":
			break;
	}
	ini_close();
}