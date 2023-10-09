scr_sound(sound_explosion)
repeat 3
	instance_create(random_range(-20, 20), random_range(-20, 20), obj_slapstar);
repeat 3
	instance_create(random_range(-20, 20), random_range(-20, 20), obj_bangeffect);
with (instance_create(x, y, obj_baddieDead))
{
	sprite_index = obj_player.spr_coneball_melting_player;
	image_speed = 0.35;
}