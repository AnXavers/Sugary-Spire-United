currentstate = nextstate;
if (currentstate == 0)
	sprite_index = spr_gateRaised;
else if (currentstate == 1)
	sprite_index = spr_gateLowered;
