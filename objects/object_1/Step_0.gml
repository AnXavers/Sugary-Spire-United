y = approach(y, inity, 0.1);
if (sprite_index == spr_object1_activeate && animation_end())
	sprite_index = spr_object1_unactive;
if (place_meeting(x, y + 24, obj_player) && sprite_index != spr_object1_activeate)
{
	game_set_speed(setspd, 0);
	sprite_index = spr_object1_activeate;
	camera_shake(20, 40);
	y -= 5;
	scr_sound(sound_stamp);
}
