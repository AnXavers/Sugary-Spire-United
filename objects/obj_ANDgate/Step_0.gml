var _values;
_values[0] = false;
var i = 0;
with (par_logicobjects)
{
	if (outputID == other.inputID)
		_values[i++] = logicOutput;
}
var _check = true;
for (i = 0; i < array_length(_values); i++)
{
	if (!_values[i])
	{
		_check = false;
		break;
	}
}
logicOutput = _check;
with (par_logicobjects)
{
	if (inputID == other.outputID)
	{
		logicOutput = _check;
		break;
	}
}
