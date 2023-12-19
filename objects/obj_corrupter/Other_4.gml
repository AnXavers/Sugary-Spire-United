repeat(100)
{
	var select = irandom(3)
	if select == 2 && chance(0.02)
		event_user(2)
	else if select != 2
		event_user(select)
}