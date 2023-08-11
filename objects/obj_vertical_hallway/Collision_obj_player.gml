if (pos_x == "POO")
	pos_x = other.x;
with (other.id)
{
	var bbox_size = abs(bbox_bottom - bbox_top);
	global.combofreeze = 30;
	x = other.pos_x;
	y = other.y + (other.sprite_height / 2);
	var _y1 = clamp(y, other.y + bbox_size, other.bbox_bottom - bbox_size);
	var ypos_difference = _y1 - other.y;
	var ypos = ypos_difference / other.image_yscale;
	targetDoor = other.targetDoor;
	targetRoom = other.targetRoom;
	vertical = true;
	verticaloffset = ypos;
	hallwaydirection = sign(other.image_yscale);
	if (!instance_exists(obj_fadeout))
	{
		scr_sound(sound_door);
		instance_create(x, y, obj_fadeout);
	}
}
