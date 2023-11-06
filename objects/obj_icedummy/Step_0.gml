if (obj_player.costumeBlockDetails[0] == 0)
	sprite_index = spr_iceplacehold;
else if (obj_player.costumeBlockDetails[0] == 1)
	sprite_index = spr_iceplacecracked;
else if (obj_player.costumeBlockDetails[0] == 2)
	sprite_index = spr_iceplacehard;
if (obj_player.state == states.costumegrab)
{
	x = obj_player.x;
	y = obj_player.y - 75;
}
else
	instance_destroy();
