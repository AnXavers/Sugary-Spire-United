var _values;
_values[0] = false;
var i = 0;
with (par_logicobjects)
{
	if (outputID == other.inputID)
		_values[i++] = logicOutput;
}
logicOutput = _values[irandom_range(0, array_length(_values) - 1)];
with (par_logicobjects)
{
	if (inputID == other.outputID)
	{
		logicOutput = other.logicOutput;
		break;
	}
}
