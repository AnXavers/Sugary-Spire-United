with other
{
	var _self = instance_nearest(x, y, obj_cottonspring)
	if ((((state == states.cotton || state = states.cottonspring) && key_attack2) || state == states.cottondrill) && _self.interactable)
	{
		var _springdir = (_self.image_angle + 90)
		_self.interactable = false
		_self.alarm[0] = (room_speed)
		scr_sound(sfx_spring)
		state = states.cottonspring
		hsp = lengthdir_x(16, _springdir)
		movespeed = hsp
		vsp = lengthdir_y(16, _springdir)
		verticalMovespeed = vsp
		draw_angle = _springdir
		sprite_index = spr_cotton_drill
		image_index = 0
		x = _self.x
		y = _self.y
	}
}