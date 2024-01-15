if (activetimer > 0)
{
	activetimer--;
	fieldsize = lerp(fieldsize, maxfieldsize, 0.05)
	if distance_to_object(obj_player) < fieldsize
		obj_player.grav = other.setgrav
	var _range = (fieldsize - 20)
	var _x = random_range(x - _range, x + _range)
	var _y = random_range(y - _range, y + _range)
	if (distance_to_point(_x, _y) < fieldsize)
		instance_create(_x, _y, obj_hallucinationzapeffect)
	image_index = 1;
}
else
{
	fieldsize = 0
	image_index = 0
}