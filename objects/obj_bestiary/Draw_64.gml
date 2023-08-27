draw_sprite(spr_lorebook, -1, 0, 0);
draw_set_font(font_console);
draw_set_halign(fa_center);
draw_set_color(c_black);
var tileArea = (rows * columns);
var entryAmt = array_length(entry);
var toPage = ((pgnum - 1) * tileArea);
var extraEntries = (entryAmt % tileArea);
var entriesLeft = (entryAmt - toPage);
var rowNum = floor((selected / columns));
var unlocked = entry[selected][4] == spr_chargershitbox;
var yy = starty;
var xx = startx;
for (var i = 0; i < (entriesLeft >= tileArea ? tileArea : extraEntries); i++)
{
	if ((i % columns) == 0)
	{
		yy += spacingy;
		xx = startx;
	}
	draw_sprite(entry[(i + toPage)][0], entry[(i + toPage)][4], xx, yy);
	xx += spacingx;
}
var selectX = (startx + (spacingx * (selected % columns)));
var selectYspace = ((pgnum - 1) * (spacingy * rows));
var selectY = (starty + ((spacingy * (rowNum + 1)) - selectYspace));
var clampY = clamp(selectY, spacingy, (spacingy * (rows + 1)));
draw_sprite(spr_lorebook_select, -1, selectX, clampY);
var select0 = (selected2 == 0 ? c_white : c_black);
var select1 = (selected2 == 1 ? c_white : c_black);
var select2 = (selected2 == 2 ? c_white : c_black);
var select3 = (selected2 == 3 ? c_white : c_black);
var totalPages = ((entryAmt % tileArea) == 0 ? floor((entryAmt / tileArea)) : (floor((entryAmt / tileArea)) + 1));
draw_sprite_ext(spr_arrow, -1, 110, 450, -1, 1, 0, select0, 1);
draw_sprite_ext(spr_arrow, -1, 232, 450, 1, 1, 0, select1, 1);
draw_sprite_ext(spr_arrow, -1, 380, 270, -1, 1, 0, select2, 1);
draw_sprite_ext(spr_arrow, -1, 900, 270, 1, 1, 0, select3, 1);
draw_text(171, 450, ((string(pgnum) + "/") + string(totalPages)));
var currentSpr = entry[selected][1];
var sety = 217;
var setx = 673;
var titleY = 50;
var killY = (titleY + 20);
scrolling = 101 < string_height_ext(entry[selected][4], 15, 400);
var cLocked = (entry[selected][4] == spr_chargershitbox ? c_white : c_black);
draw_sprite_ext(currentSpr, -1, setx, sety, 1, 1, 0, cLocked, 1);
draw_text_ext(680, titleY, entry[selected][2], 15, 200);
draw_text_ext(680, killY, entry[selected][5][unlocked], 18, 300);
draw_set_halign(fa_left);
if (!surface_exists(descSurface))
	descSurface = surface_create(417, 101);
surface_set_target(descSurface);
draw_clear_alpha(c_black, 0);
draw_text_ext(6, texty, entry[selected][3], 15, 400);
surface_reset_target();
if surface_exists(descSurface)
	draw_surface(descSurface, 462, 359);
