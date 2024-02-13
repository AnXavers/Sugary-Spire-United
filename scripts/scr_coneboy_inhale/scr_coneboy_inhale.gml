function scr_coneboy_inhale()
{
		image_speed = 0.35
	move = (key_left + key_right)
	if (substate == 0)
	{
		hsp = approach(hsp, 0, 1)
		vsp = 0
		if (!inhaling)
			inhaling = 1
		sprite_index = spr_coneboy_inhaling
		if ((!key_attack) || inhalingenemy == 1)
		{
			state = 1
			inhaling = 0
		}
		if global.player_input_device = -2
		inhalestrength = 80
		else
		{
		inhalestrength = (gamepad_button_value(0, gp_shoulderlb) * 20)
		camera_shake(inhalestrength / 16, 20 / 16)
		p1Vibration((inhalestrength + 1), 20)
		}
	}
	if (substate == 1)
	{
		hsp = (xscale * movespeed)
		movespeed = 10
		sprite_index = spr_coneboy_sworddash
		if (scr_solid((x + xscale), y, 1) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		{
			vsp = -6
			movespeed = -6
			sprite_index = spr_mach3hitwall
			state = (72 << 0)
		}
	}
	if (substate == 2)
	{
		hsp = (xscale * movespeed)
		if (!key_sprint)
		{
			state = 1
			sprite_index = spr_coneboy_idle
		}
		if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
		{
			vsp /= 20
			jumpstop = 1
		}
		if key_jump
			vsp = -9
		if (scr_solid((x + xscale), y, 1) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		{
			if (!grounded)
			{
				sprite_index = spr_coneboy_juicewallclimb
				state = (11 << 0)
				verticalMovespeed = max(3, (-vsp))
			}
			else
			{
				vsp = -6
				movespeed = -6
				sprite_index = spr_mach3hitwall
				state = (72 << 0)
			}
		}
		if (move == xscale)
			movespeed += 0.1
	}
    if (substate == 3)
    {
        if (sprite_index == spr_coneboy_chargestart)
            hsp = lerp(hsp, 0, 0.1)
        else
            hsp = (xscale * movespeed)
        vsp = 0
        if animation_end()
        {
            if (sprite_index == spr_coneboy_chargestart)
            {
                image_index = 0
                sprite_index = spr_coneboy_chargeloop
				flash = true
				movespeed = 9
				create_heat_afterimage(0);
				instance_create(x, y, obj_crazyrunothereffect);
				if (!instance_exists(obj_superdashcloud) && grounded)
					instance_create(x, y, obj_superdashcloud, 
					{
						obj_player: id
					});
            }
            else
            {
                state = (key_sprint ? states.mach3 : states.normal)
                image_index = 0
				flash = states.mach3
                sprite_index = (states.mach3 ? spr_coneboy_dash : spr_coneboy_idle)
            }
        }
		if sprite_index = spr_coneboy_chargeloop
			 movespeed = approach(movespeed, 14, 0.4)
    }
}