kettle_index++
var _ranx = random(64 * image_xscale)
repeat floor(image_xscale)
{
	if chance(0.05)
		instance_create((x + _ranx), y + (sprite_height * 0.5 - 48), obj_teakettle_gas)
}