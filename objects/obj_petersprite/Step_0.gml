if global.petersprite == 0
	instance_destroy()
x = obj_player.x
y = obj_player.y
image_xscale = obj_player.image_xscale
image_yscale = obj_player.image_yscale
image_angle = obj_player.draw_angle
sprite_index = asset_get_index(global.petersprite)
if (obj_player.state == 70 || obj_player.state == 3 || obj_player.state == 69 || obj_player.state == 5 || (obj_player.state == 71 && obj_player.mach2 >= 100) || (obj_player.state == 31 && obj_player.sprite_index != obj_player.spr_crouchslip && obj_player.movespeed >= 12) || obj_player.state == 17 || obj_player.state == 97 || obj_player.state == 101 || (obj_player.state == 104 && obj_player.sprite_index != spr_pizzano_sjumpprepside) || obj_player.state == 121 || (obj_player.state == 28 && obj_player.mach2 >= 100))
{
	if (obj_player.mach_aftimg <= 0)
		create_afterimage(choose(1, 2), image_xscale, true);
}
if (obj_player.state == 106 && obj_player.blue_aftimg <= 0)
	create_afterimage(choose(4, 5), image_xscale, true);
obj_player.visible = false