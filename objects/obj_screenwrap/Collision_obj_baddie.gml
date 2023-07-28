if (!receiver)
{
	var p = other.id;
	var offset = p.y - y;
	with (obj_screenwrap)
	{
		if (trigger == other.trigger && receiver)
		{
			if (type == 0)
			{
				p.x = x;
				p.y = y + offset;
			}
			else
				p.y = y;
		}
	}
}
