if distance_to_object(obj_player) < 300
	disappear = true
if disappear
{
	image_alpha -= 0.02
}
if image_alpha == 0
	instance_destroy()
else if image_alpha < 0.1 && image_alpha > 0.05
{
	repeat (8)
	{
		with instance_create_layer(x + random_range(-(sprite_width / 2), (sprite_width / 2)), y + random_range(-(sprite_height / 2), (sprite_height / 2)), global.hallucinationeffect, obj_cloudrisingeffect)
		{
			vspeed = clamp((y - other.y) / (sprite_height / 4), 0, 4)
			hspeed = clamp((x - other.x) / (sprite_width / 4), -4, 4)
		}
		repeat (2)
			instance_create_layer(x + random_range(-(sprite_width / 2), (sprite_width / 2)), y + random_range(-(sprite_height / 2), (sprite_height / 2)), global.hallucinationeffect, obj_hallucinationzapeffect)
	}
}