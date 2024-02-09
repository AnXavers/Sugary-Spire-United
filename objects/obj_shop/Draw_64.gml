if currentcategory == 0
{
	draw_sprite_stretched(spr_elevatorGUI, 0, 30, 0, 300, 520)
	draw_set_halign(fa_center)
	draw_set_font(global.npcfont)
	draw_option(150, 100, "Shop", !selectedcategory)
	draw_option(150, 150, "Exit", selectedcategory)
}