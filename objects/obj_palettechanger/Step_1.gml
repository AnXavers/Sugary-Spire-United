if (inputbuffer > 0)
	inputbuffer--;
if (deletebuffer > 0)
	deletebuffer--;
with (ImportButton)
{
	if (buffertimer > 0)
		buffertimer--;
	if (buffertimer <= 0)
	{
		buffertimer = 0;
		activated = false;
	}
}
with (ExportButton)
{
	if (buffertimer > 0)
		buffertimer--;
	if (buffertimer <= 0)
	{
		buffertimer = 0;
		activated = false;
	}
}
