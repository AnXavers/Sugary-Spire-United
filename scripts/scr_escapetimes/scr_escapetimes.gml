function scr_escapetimes(argument0 = global.levelname)
{
	var seconds = 0;
	var minutes = 0;
	switch (argument0)
	{
		case "steamy":
			minutes = 4;
			seconds = 0;
			break;
		case "stormy":
			minutes = 4;
			seconds = 0;
			break;
		case "entryway":
			minutes = 3;
			seconds = 0;
			break;
		case "molasses":
			minutes = 5;
			seconds = 0;
			break;
		case "mines":
			minutes = 4;
			seconds = 50;
			break;
		case "dragonlair":
			minutes = 15;
			seconds = 30;
			break;
		case "fudge":
			minutes = 5;
			seconds = 0;
			break;
		case "dance":
			minutes = 4;
			seconds = 0;
			break;
		case "estate":
			minutes = 4;
			seconds = 55;
			break;
		case "sucrose":
			minutes = 6;
			seconds = 30;
			break;
		case "bee":
			minutes = 4;
			seconds = 0;
			break;
		case "martian":
			minutes = 4;
			seconds = 0;
			break;
		case "exitway":
			minutes = 4;
			seconds = 0;
			break;
		case "entrance":
			minutes = 2;
			seconds = 35;
			break;
		case "pizzascape":
			minutes = 2;
			seconds = 50;
			break;
		case "ancient":
			minutes = 2;
			seconds = 50;
			break;
		case "bloodsauce":
			minutes = 3;
			seconds = 25;
			break;
		case "finale":
			minutes = 8;
			seconds = 0;
			break;
		case "yogurt":
			minutes = 8;
			seconds = 0;
			break;
		default:
			minutes = 99124871759815;
			seconds = 59;
			break;
	}
	if obj_tv.sucroseTimer
	{
		minutes = 0
		seconds = 30
	}
	var time_array;
	time_array[0] = minutes;
	time_array[1] = seconds;
	return time_array;
}
function scr_laptimes(argument0 = global.levelname)
{
	var seconds = 0;
	var minutes = 0;
	switch (argument0)
	{
		case "steamy":
			minutes = 1;
			seconds = 15;
			break;
		case "stormy":
			minutes = 1;
			seconds = 15;
			break;
		case "entryway":
			minutes = 1;
			seconds = 10;
			break;
		case "molasses":
			minutes = 1;
			seconds = 10;
			break;
		case "mines":
			minutes = 1;
			seconds = 30;
			break;
		case "dragonlair":
			minutes = 8;
			seconds = 30;
			break;
		case "fudge":
			minutes = 2;
			seconds = 10;
			break;
		case "dance":
			minutes = 1;
			seconds = 30;
			break;
		case "estate":
			minutes = 2;
			seconds = 15;
			break;
		case "sucrose":
			minutes = 3;
			seconds = 0;
			break;
		case "bee":
			minutes = 1;
			seconds = 30;
			break;
		case "martian":
			minutes = 1;
			seconds = 30;
			break;
		case "exitway":
			minutes = 1;
			seconds = 30;
			break;
		case "entrance":
			minutes = 1;
			seconds = 0;
			break;
		case "pizzascape":
			minutes = 1;
			seconds = 0;
			break;
		case "ancient":
			minutes = 1;
			seconds = 0;
			break;
		case "bloodsauce":
			minutes = 1;
			seconds = 0;
			break;
		case "finale":
			minutes = 5;
			seconds = 0;
		default:
			minutes = 99124871759815;
			seconds = 59;
			break;
	}
	if obj_tv.sucroseTimer
	{
		minutes = 0;
		seconds = 0;
	}
	var time_array;
	time_array[0] = minutes;
	time_array[1] = seconds;
	return time_array;
}