pickthrowtime -= 0.5;
if (((obj_player.x > (x - 300) && obj_player.x < (x + 300)) && (y <= (obj_player.y + 200) && y >= (obj_player.y - 200))) && obj_player.state != 88 && obj_player.state != 97 && obj_player.state != 77 && obj_player.state != 98 && obj_player.state != 112)
{
	sprite_index = spr_lolipopmineranger;
	if (pickthrowtime == 0)
	{
		with (instance_create(x, y, obj_pickaxeprojectile))
			image_xscale = other.image_xscale;
		pickthrowtime = irandom_range(200, 500);
	}
}
else
	sprite_index = spr_lolipopmineridle;
