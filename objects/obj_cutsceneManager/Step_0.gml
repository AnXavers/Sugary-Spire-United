if (!is_undefined(Event))
{
	if (is_array(Event))
	{
		switch (array_length(Event) - 1)
		{
			case 0:
				script_execute(Event[0]);
				break;
			case 1:
				script_execute(Event[0], Event[1]);
				break;
			case 2:
				script_execute(Event[0], Event[1], Event[2]);
				break;
			case 3:
				script_execute(Event[0], Event[1], Event[2], Event[3]);
				break;
			case 4:
				script_execute(Event[0], Event[1], Event[2], Event[3], Event[4]);
				break;
			case 5:
				script_execute(Event[0], Event[1], Event[2], Event[3], Event[4], Event[5]);
				break;
		}
	}
	else
		Event();
}
