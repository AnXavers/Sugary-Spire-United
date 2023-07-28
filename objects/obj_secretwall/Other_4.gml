revealActivated = ds_list_find_index(global.saveroom, id) != -1;
var _condition = revealCondition();
if (_condition || (stopFadeBackIn && revealActivated))
	secretAlpha = 0;
