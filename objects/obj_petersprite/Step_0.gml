x = obj_player.x + global.peterxoffset
y = obj_player.y + global.peteryoffset

image_xscale = obj_player.image_xscale * real(global.peterxscale)
image_yscale = obj_player.image_yscale * real(global.peteryscale)
image_angle = obj_player.draw_angle + global.peterangle
if global.peterdepth = 9999
	depth = obj_player.depth
else
	depth = global.peterdepth
if global.peterpalette
	scr_palette_as_player()
if global.peterupdate
{
	sprite_index = asset_get_index(global.petersprite)
	image_index = global.peterimage
	image_speed = global.peterspeed
	global.peterupdate = 0
}
if (obj_player.state == 70 || obj_player.state == 3 || obj_player.state == 69 || obj_player.state == 5 || (obj_player.state == 71 && obj_player.mach2 >= 100) || (obj_player.state == 31 && obj_player.sprite_index != obj_player.spr_crouchslip && obj_player.movespeed >= 12) || obj_player.state == 17 || obj_player.state == 97 || obj_player.state == 101 || (obj_player.state == 104 && obj_player.sprite_index != spr_pizzano_sjumpprepside) || obj_player.state == 121 || (obj_player.state == 28 && obj_player.mach2 >= 100))
{
	if (obj_player.mach_aftimg <= 0)
		create_afterimage(choose(1, 2), image_xscale, true);
}
if (obj_player.state == 106 && obj_player.blue_aftimg <= 0)
	create_afterimage(choose(4, 5), image_xscale, true);
obj_player.visible = false