function state_player_honey()
{
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	move = key_left + key_right;
	sprite_index = spr_player_honeystuck;
	image_speed = 0.35;
	if (move != 0)
		xscale = move;
	var webID = instance_place(x, y, obj_honeypanel);
	if (instance_exists(webID))
	{
		x = lerp(x, webID.x, 0.3);
		y = lerp(y, webID.y, 0.3);
	}
	if (key_jump || key_slap2)
	{
		if (instance_exists(webID))
		{
			x = webID.x;
			y = webID.y;
		}
		if (state != 45 || state != 93)
			scr_taunt_setVariables();
		if (state == 45 || state == 93)
			state = 1;
		vsp = 0;
		if (key_jump2)
			vsp = -11;
		if (state == 71)
			state = 69;
		if (state == 28)
		{
			sprite_index = spr_jump;
			movespeed = 0;
			state = 60;
		}
		jumpAnim = 1;
		scr_sound(sound_jump);
		if (instance_exists(webID))
		{
			with (webID)
				event_user(0);
		}
	}
	exit;
}
