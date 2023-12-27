function scr_levelstart(argument0, argument1)
{
	switch (argument0)
	{
		case "tutorial":
			global.srank = 19500;
			global.harrycolor = 0;
			break;
		case "entryway":
			global.srank = 19500;
			global.harrycolor = 0;
			break;
		case "steamy":
			global.srank = 23000;
			global.harrycolor = 0;
			break;
		case "storm":
			global.srank = 24000;
			global.harrycolor = 3;
			break;
		case "molasses":
			global.srank = 23500;
			global.harrycolor = 0;
			break;
		case "mines":
			global.srank = 26500;
			global.harrycolor = 0;
			break;
		case "fudge":
			global.srank = 28000;
			global.harrycolor = 1;
			break;
		case "dance":
			global.srank = 21000;
			global.harrycolor = 1;
			break;
		case "sucrose":
			global.srank = 30000;
			global.harrycolor = 2;
			break;
		case "estate":
			global.srank = 26500;
			global.harrycolor = 1;
			break;
		case "bee":
			global.srank = 29000;
			global.harrycolor = 1;
			break;
		case "finale":
			global.srank = 19500;
			global.harrycolor = 4;
			break;
		case "exitway":
			global.srank = 19500;
			global.harrycolor = 3;
			break;
		case "bloodsauce":
			global.srank = 18500;
			global.harrycolor = 5;
			break;
		case "entrance":
			global.srank = 16000;
			global.harrycolor = 5;
			break;
		case "dragonlair":
			global.srank = 30000;
			global.harrycolor = 3;
			break;
		default:
			global.srank = 99999;
			global.harrycolor = 0;
			break;
	}
	global.firstlvlRoom = argument1;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
function modifierinitiate()
{
	var _lvl = capitalize_section(global.levelname, 1, 1) + "Modifiers"
	ini_open("optionData.ini");
	global.gamemode = ini_read_real(_lvl, "gamemode", 0);
	global.leveldesign = ini_read_real(_lvl, "leveldesign", 1);
	global.lapmode = ini_read_real(_lvl, "lapmode", 1);
	global.jerald = ini_read_real(_lvl, "jerald", 0);
	global.perfect = ini_read_real(_lvl, "perfect", 0);
	global.flashlight = ini_read_real(_lvl, "flashlight", 0);
	global.collects = ini_read_real(_lvl, "collects", 1);
	global.breakables = ini_read_real(_lvl, "breakables", 1);
	global.enemies = ini_read_real(_lvl, "enemies", 1);
	global.escapetimer = ini_read_real(_lvl, "escapetimer", 0);
	ini_close();
	with obj_player
	{
		switch global.leveldesign
		{
			case 1:
				if ((asset_get_index(room_get_name(targetRoom) + "_new")) != -1)
					targetRoom = asset_get_index(room_get_name(targetRoom) + "_new")
				break;
			case 2:
				if ((asset_get_index(room_get_name(targetRoom) + "_old")) != -1)
					targetRoom = asset_get_index(room_get_name(targetRoom) + "_old")
				break;
			case 3:
				if ((asset_get_index(room_get_name(targetRoom) + "_custom")) != -1)
					targetRoom = asset_get_index(room_get_name(targetRoom) + "_custom")
				break;
		}
	}
}