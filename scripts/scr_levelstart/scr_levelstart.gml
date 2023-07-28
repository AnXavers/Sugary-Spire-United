function scr_levelstart()
{
	switch (argument0)
	{
		case "entryway":
			global.srank = 19500;
			break;
		case "steamy":
			global.srank = 23000;
			break;
		case "molasses":
			global.srank = 23500;
			break;
		case "mines":
			global.srank = 26500;
			break;
		case "fudge":
			global.srank = 28000;
			break;
		case "dance":
			global.srank = 21000;
			break;
		case "sucrose":
			global.srank = 18000;
		case "estate":
			global.srank = 26500;
			break;
		case "bee":
			global.srank = 29000;
			break;
		default:
			global.srank = 99999;
			break;
	}
	global.firstlvlRoom = argument1;
	global.arank = global.srank - (global.srank / 4);
	global.brank = global.srank - ((global.srank / 4) * 2);
	global.crank = global.srank - ((global.srank / 4) * 3);
}
