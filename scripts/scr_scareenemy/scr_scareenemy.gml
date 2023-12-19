function scr_scareenemy()
{
	if (!secretjumped && point_in_rectangle(x, y, obj_player.x - 400, obj_player.y - 60, obj_player.x + 400, obj_player.y + 60) && brave_timer <= 0 && (obj_player.state == states.mach3 || ((obj_player.movespeed >= 10 && obj_player.state == states.minecart) || (obj_player.movespeed >= 6 && obj_player.state == states.rupertslide) || (obj_player.move != 0 && obj_player.state == states.cookiemount) || obj_player.state == states.pepperman_pinball || obj_player.state == states.pizzano_rocketfist || obj_player.state = states.cookiemountattack)))
	{
		if (state != 9 && !thrown && !throw_hit)
		{
			state = 9;
			sprite_index = scaredspr;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			hsp = 0;
			if (grav != 0 && grounded)
				vsp = -3;
			image_index = 0;
		}
		var max_buf = 80;
		var min_buf = 50;
		ScareBuffer = clamp(ScareBuffer++, min_buf, max_buf);
	}
	ScareBuffer--;
	brave_timer--;
	if (scare_jump_buffer > 0)
		scare_jump_buffer--;
	if (ScareBuffer <= 0 && state == 9)
	{
		state = 3;
		sprite_index = walkspr;
		ScareBuffer = 0;
		scare_jump = false;
	}
}
