with obj_player
{
	if (key_up2)
	{
		instance_create_depth(x, y, -45, obj_poofeffect);
		scr_sound(sfx_palswap);
		charactertemp = other.character;
		other.character = character;
		character = charactertemp;
		ini_open(global.fileselect);
		ini_write_string("Carryover", "player", character)
		ini_close();
		characterspr();
		characterpal();
		charactergui();
		characterenv();
		charactersfx();
		paletteselect = clamp(paletteselect, 1, palnum)
	}
}