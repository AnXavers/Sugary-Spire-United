with (other)
{
	if (state == states.handstandjump && state != states.bombpep)
	{
		state = states.holdbomb;
		bombID = other.id;
		sprite_index = spr_grab;
		image_index = 0;
		other.state = states.grab;
	}
}
