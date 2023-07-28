if (is_error)
{
	var spritenumb = 1123;
	sprite_index = irandom_range(0, spritenumb);
	while (sprite_get_width(sprite_index) > 200 || sprite_get_height(sprite_index) > 200 || !sprite_exists(sprite_index))
		sprite_index = irandom_range(0, spritenumb);
	image_speed = random_range(0.35, 2);
	image_angle = random_range(0, 360);
	error_shake = irandom_range(-1, 10);
}
alarm[0] = irandom_range(5, 75);
