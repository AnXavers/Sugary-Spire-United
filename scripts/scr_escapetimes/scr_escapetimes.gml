function scr_escapetimes(argument0 = room)
{
	var seconds = 0;
	var minutes = 0;
	switch (argument0)
	{
		case 35:
			minutes = 4;
			seconds = 0;
			break;
		case 20:
			minutes = 3;
			seconds = 0;
			break;
		case 50:
			minutes = 5;
			seconds = 0;
			break;
		case 84:
			minutes = 4;
			seconds = 50;
			break;
		case 95:
			minutes = 15;
			seconds = 30;
			break;
		case 116:
			minutes = 5;
			seconds = 0;
			break;
		case 11:
			minutes = 5;
			seconds = 0;
			break;
		case 134:
			minutes = 7;
			seconds = 30;
			break;
		case 208:
			minutes = 4;
			seconds = 0;
			break;
		case 209:
			minutes = 4;
			seconds = 55;
			break;
		case 231:
			minutes = 4;
			seconds = 0;
			break;
		default:
			minutes = 99124871759815;
			seconds = 59;
			break;
	}
	
	var time_array;
	time_array[0] = minutes;
	time_array[1] = seconds;
	return time_array;
}
function scr_laptimes(argument0 = room)
{
	var seconds = 0;
	var minutes = 0;
	switch (argument0)
	{
		case 153:
			minutes = 0;
			seconds = 45;
			break;
		case 155:
			minutes = 1;
			seconds = 0;
			break;
		case 42:
			minutes = 1;
			seconds = 20;
			break;
		case 67:
			minutes = 1;
			seconds = 45;
			break;
		case 164:
			minutes = 2;
			seconds = 30;
			break;
		default:
			minutes = 0;
			seconds = 45;
			break;
	}
	
	var time_array;
	time_array[0] = minutes;
	time_array[1] = seconds;
	return time_array;
}
