var _self = id
with other
{
	if ((((state == states.cotton || state = states.cottonspring) && key_attack2) || state == states.cottondrill) && _self.interactable)
	{
		var _springdir = (_self.image_angle + 90)
		_self.interactable = false
		_self.alarm[0] = (room_speed)
		scr_sound(sfx_spring)
		state = states.cottonspring
		hsp = lengthdir_x(_self.speedgiven, _springdir)
		movespeed = hsp
		vsp = lengthdir_y(_self.speedgiven, _springdir)
		verticalMovespeed = vsp
		draw_angle = _springdir
		sprite_index = spr_cotton_drill
		image_index = 0
		x = _self.x
		y = _self.y
		lastcottonspring = _self
		_self.alarm[1] = (room_speed * _self.duration)
	}
}