function state_player_drown()
{
	var _waterY = y;
	with (instance_place(x, y, obj_molasseswater))
		_waterY = wave(3, -3, 3, 0) + (y + 9);
	y = round(lerp(y, _waterY, 0.25));
	vsp = round(lerp(0, vsp, 0.15));
	hsp = round(lerp(0, hsp, 0.15));
	if (animation_end() || key_down)
		scr_playerrespawn(false);
	if (key_jump && !key_down)
	{
		scr_sound(sound_jump);
		sprite_index = spr_player_drown_jump;
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -12;
		state = 60;
		image_index = 0;
	}
	image_speed = 0.35;
}
