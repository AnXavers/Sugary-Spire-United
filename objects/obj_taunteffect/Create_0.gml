with obj_player
{
	if tauntStored.state != states.trick
	{
		tauntsound = asset_get_index(sfx_taunt + string(irandom_range(1, taunt_upperrange)))
		if (character == "P" && chance(0.01))
			tauntsound = sfx_goofytaunt1
		tauntsfx = scr_sound(tauntsound);
		if character == "T"
		{
			switch noisetaunt
			{
				case 1:
				case 3:
				case 6:
				{
					audio_sound_pitch(tauntsfx, 0.75);
					break;
				}
				case 4:
				case 5:
				{
					audio_sound_pitch(tauntsfx, 0.80);
					break;
				}
			}
			noisetaunt++
			noisetaunt = wrap(noisetaunt, 0, 6)
		}
		else
			noisetaunt = 0
	}
	else
		instance_create(x, y, obj_trickeffect)
}
image_speed = 0.5;
depth = -1