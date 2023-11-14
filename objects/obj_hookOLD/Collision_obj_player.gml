if (other.state != states.hooks && other.state != 0 && other.state != states.noclip)
{
	with (other)
	{
		switch (state)
		{
			case 17:
				playerPrevState = 69;
				playerPrevSprite = spr_mach2;
				break;
			case 73:
				playerPrevState = 69;
				playerPrevSprite = spr_mach2;
				break;
			case 71:
				if (sprite_index == spr_machslideboost3)
				{
					playerPrevState = 70;
					playerPrevSprite = spr_mach3player;
				}
				else if (sprite_index == spr_machslideboost)
				{
					playerPrevState = 69;
					playerPrevSprite = spr_mach2;
				}
				else
				{
					playerPrevState = 71;
					playerPrevSprite = spr_crouchslide;
				}
				break;
			case 88:
			case 97:
			case 98:
				playerPrevState = 69;
				playerPrevSprite = spr_mach2jump;
				break;
			case 96:
				playerPrevState = 69;
				playerPrevSprite = spr_mach2jump;
				break;
			default:
				playerPrevSprite = sprite_index;
				playerPrevState = state;
				break;
		}
		y = other.y - 14;
		x = other.x;
		state = states.hooks;
		if (other.hookSubState == 2)
			xscale = 1;
		else if (other.hookSubState == 1)
			xscale = -1;
		substate = other.hookSubState;
		verticalMovespeed = vsp;
		hspCarry = 0;
		slideHsp = 0;
		vspCarry = 0;
	}
	audio_emitter_free(hookSoundEmitter);
}
