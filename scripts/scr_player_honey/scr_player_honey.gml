function state_player_honey()
{
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	move = key_left + key_right;
	sprite_index = spr_honeystuck;
	image_speed = 0.35;
	if (move != 0)
		xscale = move;
	var webID = instance_place(x, y, obj_honeypanel);
	if (instance_exists(webID))
	{
		x = lerp(x, webID.x, 0.3);
		y = lerp(y, webID.y, 0.3);
	}
	if (key_jump || key_attack2)
	{
		if (instance_exists(webID))
		{
			x = webID.x;
			y = webID.y;
		}
		if (state != states.backbreaker || state != states.parry)
			scr_taunt_setVariables();
		if (state == states.backbreaker || state == states.parry)
			state = states.normal;
		vsp = 0;
		if (key_jump2)
			vsp = -11;
		if (state == states.machslide)
			state = states.mach2;
		if (state == states.chainsaw)
		{
			sprite_index = spr_pizzelle_jump;
			movespeed = 0;
			state = states.jump;
		}
		jumpAnim = 1;
		audio_stop_sound(sfx_honeysplat)
		scr_sound(sound_jump);
		scr_sound(sfx_honeyrelease);
		if (instance_exists(webID))
		{
			with (webID)
				event_user(0);
		}
	}
	exit;
}
