if (Checkpointactivated == 1 && sprite_index == spr_checkpointflag_unvisit)
{
	image_index = 0;
	sprite_index = spr_checkpointflag_appear;
}
else if (Checkpointactivated == 0)
	sprite_index = spr_checkpointflag_unvisit;
