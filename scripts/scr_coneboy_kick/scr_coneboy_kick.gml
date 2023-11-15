function scr_coneboy_kick() //gml_Script_scr_coneboy_kick
{
	move = (key_left + key_right)
	landAnim = 0
	if (substate == 0)
	{
		if ((!(place_meeting(x, (y + 1), obj_railh))) && (!(place_meeting(x, (y + 1), obj_railh2))))
			hsp = (xscale * movespeed)
		else if place_meeting(x, (y + 1), obj_railh)
			hsp = ((xscale * movespeed) - 5)
		else if place_meeting(x, (y + 1), obj_railh2)
			hsp = ((xscale * movespeed) + 5)
		if (move != 0)
			movespeed = approach(movespeed, (11 * move), 0.5)
		else if (move == 0)
			movespeed = approach(movespeed, 0, 0.5)
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_coneboy_kick)
			state = states.normal
	}
	if (substate == 2)
	{
		hsp = (xscale * movespeed)
		if (move != 0)
			movespeed = approach(movespeed, ((5 * xscale) * move), 0.5)
		else
			movespeed = approach(movespeed, 0, 0.5)
		if (!key_shoot)
			state = states.normal
		else if (animation_end() && sprite_index == spr_coneboy_juicespit)
		{
			with (instance_create(x, y, obj_coneboyswordhitbox))
				sprite_index = spr_coneboy_bigspithitbox
			sprite_index = spr_coneboy_juicespitbig
		}
	}
	image_speed = 0.4
}

