with obj_player
{
	other.x = x;
	other.y = y;
	if (sprite_index != spr_taunt && tauntStored.state != states.trick)
		instance_destroy(other);
	else if ((sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3) && tauntStored.state != states.trick)
		instance_destroy(other);
	else if tauntStored.state == states.trick
	{
		other.trickxpos++
		other.trickalpha = approach(other.trickalpha, 0, 0.1)
	}
}