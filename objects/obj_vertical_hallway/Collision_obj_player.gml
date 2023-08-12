if (pos_x == "POO")
	pos_x = other.x
with (other.id)
{
	var bbox_size = abs((bbox_right - bbox_left))
	global.combofreeze = 30
	x = other.pos_x
	y = (other.y + (other.sprite_height / 2))
	var _x1 = clamp(x, (other.x + bbox_size), (other.bbox_right - bbox_size))
	var xpos_difference = (_x1 - other.x)
	var xpos = (xpos_difference / other.image_xscale)
	var xpos_offset = (xpos * other.hallwayxscale)
	targetDoor = other.targetDoor
	targetRoom = other.targetRoom
	vertical = 1
	verticaloffset = xpos_offset
	hallwaydirection = sign(other.image_yscale)
	if (!instance_exists(obj_fadeout))
	{
		scr_sound(sound_door)
		instance_create(x, y, obj_fadeout)
	}
}
