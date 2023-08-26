obj_tv.image_index = irandom_range(0, 4);
repeat (3)
	instance_create(x, y, obj_slapstar);
instance_create(x, y + 30, obj_bangeffect);
camera_shake(3, 3);
show_message("Your not supposed to be here.")
game_end()