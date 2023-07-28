draw_set_font(global.smallfont);
if (obj_player.paletteselect < array_length(palnames[curchar]))
	palettename = palnames[curchar][obj_player.paletteselect];
if (drawing == 1)
{
	if (bgblend != 1)
		bgblend += 0.1;
	if (fally != 0)
		fally += 60;
}
else if (drawing == 0)
{
	if (bgblend != 0)
		bgblend -= 0.1;
	if (fally != -540)
		fally -= 60;
}
if (fally == 0)
{
	if (textblend != 1)
		textblend += 0.1;
}
if (fally > 0)
	textblend = 0;
