var curMsg = global.dialogmsg[current_message];
var dialogLength = array_length(global.dialogmsg);
var _func = curMsg[3];
if (_func != -4)
	_func();
if (state != 3)
{
	drawchar = 0;
	if (current_message == (dialogLength - 1))
		state = 1;
	else
		current_message++;
}
force_next = false;
