if (!reciever && !active && obj_player.state != states.donothing && !global.freezeframe && is_for_me)
{
	alarm[0] = 25;
	active = true;
	with (obj_player)
	{
		visible = false;
		other.storedstate = state;
		tauntstoredstate = state;
		other.storedmovespeed = movespeed;
		other.storedgrav = grav;
		other.storedimageindex = image_index;
		other.storedspriteindex = sprite_index;
		other.storedfreefallsmash = freefallsmash;
		hsp = 0;
		vsp = 0;
		grav = 0;
		alarm[7] = 50;
		alarm[5] = 2;
		hurted = 1;
		state = states.donothing;
	}
}
