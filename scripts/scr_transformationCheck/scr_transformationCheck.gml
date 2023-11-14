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
		case states.rupertnormal:
		case states.rupertslide:
		case states.rupertstick:
		case states.rupertjump:
			_transfo = "Rupert";
			break;
		case states.frostburn:
		case states.frostburnbump:
		case states.frostburnspin:
		case states.frostburnwallrun:
			_transfo = "Frostburn";
			break;
		case states.ufodash:
		case states.ufodashOLD:
		case states.ufofloat:
			_transfo = "UFO";
			break;
		case states.seacream:
		case states.seacreamjump:
		case states.seacreamstick:
			_transfo = "SeaCream";
			break;
	}
	return _transfo;
}
