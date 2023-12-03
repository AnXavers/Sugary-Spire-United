if (fadealpha > 1)
{
	scr_layerswap();
	obj_tv.tvbg = spr_tvbgescape;
	with (obj_collectEscape)
	{
		image_alpha = 1;
		instance_create(x, y, obj_poofeffect);
	}
	with (obj_bigcollectEscape)
	{
		image_alpha = 1;
		instance_create(x, y, obj_poofeffect);
	}
	fadein = 1;
}
if (fadein == 0)
	fadealpha += 0.375;
else if (fadein == 1)
	fadealpha -= 0.375;
if (fadealpha == 0)
	instance_destroy();
