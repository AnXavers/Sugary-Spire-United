if (!receiver)
{
	var p = other.id;
	var xoffset = p.x - x;
	var offset = p.y - y;
	with (obj_screenwrap)
	{
		if (trigger == other.trigger && receiver)
		{
			if (vertical == 0)
			{
				p.x = x;
				p.y = y + offset;
			}
			else
			{
				p.y = y;
				p.x = x + xoffset;
			}
		}
	}
}
