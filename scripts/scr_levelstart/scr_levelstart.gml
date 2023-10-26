function scr_levelstart()
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
