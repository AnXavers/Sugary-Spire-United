with (other)
{
	if (!cutscene && !global.freezeframe && (state != states.backbreaker && state != states.freefall && state != states.freefallprep && state != states.freefallland))
	{
		jumpstop = true;
		vsp = -21;
		if (state == states.normal || state == states.crouchslide || state == states.crouch || state == states.handstandjump || state == states.machslide)
			state = states.jump;
		if (state == states.gumballoon || state == states.rupertnormal || state == states.gumballoon)
		{
			image_index = 0;
			sprite_index = spr_skatejumpstart;
			state = states.gumballoon;
		}
		if (state == states.climbwall || state == states.climbdownwall || state == states.climbceiling || state == states.machroll)
			state = states.mach2;
		if (state == states.jump || state == states.normal)
		{
			sprite_index = spr_outofcontrolfall;
			image_index = 0;
		}
		with (other)
		{
			sprite_index = spr_marshmallowSpring_active;
			image_index = 0;
		}
	}
}
