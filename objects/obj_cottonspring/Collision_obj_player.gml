var _self = self
var _springdir = (image_angle + 90)
with other
{
	if ((((state == states.cotton || state = states.cottonspring) && key_attack2) || state == states.cottondrill) && _self.interactable)
	{
		_self.interactable = false
		_self.alarm[0] = (room_speed * 2)
		image_angle = _self.image_angle
		scr_sound(sfx_spring)
		state = states.cottonspring
		hsp = lengthdir_x(16, _springdir)
		movespeed = hsp
		vsp = lengthdir_y(16, _springdir)
		verticalMovespeed = vsp
		sprite_index = spr_cotton_drill
		image_index = 0
		x = _self.x
		y = _self.y
	}
}