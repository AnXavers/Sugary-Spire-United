x = xstart;
y = ystart;
TrueY = ystart;
falling = false;
fallbuffer = 80;
repeat (1 + floor(sprite_width / 128))
	instance_create((x + irandom_range(((-sprite_width) / 2), (sprite_width / 2))), (y + irandom_range(5, -10)), obj_poofeffect)
