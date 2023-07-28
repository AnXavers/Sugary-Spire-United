var _condition = revealCondition();
if (_condition || (stopFadeBackIn && revealActivated))
{
	secretAlpha = approach(secretAlpha, 0, 0.15);
	if (ds_list_find_index(global.saveroom, id) == -1)
		ds_list_add(global.saveroom, id);
	revealActivated = true;
}
else
	secretAlpha = approach(secretAlpha, 1, 0.15);
