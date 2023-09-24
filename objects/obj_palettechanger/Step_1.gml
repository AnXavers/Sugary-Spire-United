if (inputbuffer > 0)
	inputbuffer--
if (deletebuffer > 0)
	deletebuffer--
with (ImportButton)
{
	if (buffertimer > 0)
		buffertimer--
	if (buffertimer <= 0)
	{
		buffertimer = 0
		activated = 0
	}
}
with (ExportButton)
{
	if (buffertimer > 0)
		buffertimer--
	if (buffertimer <= 0)
	{
		buffertimer = 0
		activated = 0
	}
}
