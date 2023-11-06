function scr_transformationCheck(argument0)
{
	var _transfo = undefined;
	switch (argument0)
	{
		case states.cotton:
		case states.cottondrill:
		case states.cottonroll:
			_transfo = "Cottoncoated";
			break;
		case 147:
		case 145:
		case 146:
		case 148:
			_transfo = "Rupert";
			break;
		case states.ufodash:
		case states.ufodashOLD:
		case states.ufofloat:
			_transfo = "UFO";
			break;
		case 140:
		case 141:
		case 142:
			_transfo = "SeaCream";
			break;
	}
	return _transfo;
}
