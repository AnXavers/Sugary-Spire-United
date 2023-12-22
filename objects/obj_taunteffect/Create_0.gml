trickxpos = 50
trickalpha = 0.5
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
	{
		scr_sound(asset_get_index("sfx_trick" + string(clamp(trickcount, 1, 6))))
	}
}
image_speed = 0.5;
sprite_index = spr_taunteffect
depth = -1
if (global.panic = 1 && global.exitgatetaunt < 10 && place_meeting(x, y, obj_exitgate))
{
	create_small_number(x, y, "25");
	global.collect += 25
	global.exitgatetaunt++
}