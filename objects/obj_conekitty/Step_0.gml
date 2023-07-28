event_inherited();
my_y = lerp(my_y, my_y + wave(-1, 1, 4, 0), 0.25);
xscale = (obj_player.x > x) ? 1 : -1;
if (floor(image_index) == 9 && !madedebris)
{
	with (instance_create(x, my_y, obj_conekittydebris))
		image_xscale = other.xscale;
	madedebris = true;
}
else if (floor(image_index) != 9)
	madedebris = false;
