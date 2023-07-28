if (!global.freezeframe)
{
	hsp = image_xscale * movespeed;
	if (scr_solid(x, y + sign(vsp)) && bounced < 2 && vsp > 0)
	{
		bounced++;
		vsp = -5;
	}
	else if (scr_solid(x, y + sign(vsp)) && vsp > 0)
		instance_destroy();
	if (scr_solid(x + sign(image_xscale), y, true) && !place_meeting(x + sign(image_xscale), y, obj_destructibles))
		image_xscale *= -1;
}
