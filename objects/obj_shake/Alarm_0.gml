if (sprite_index != spr_juicedead)
{
	with (instance_create(x, y, obj_baddieDead))
	{
		spr_palette = other.spr_palette;
		paletteselect = other.paletteselect;
		sprite_index = other.sprite_index;
		image_xscale = other.image_xscale;
		canrotate = true;
		vsp = irandom_range(-5, -15);
		hsp = choose(1, -1) * irandom_range(5, 15);
	}
}
else
{
	var i = 0;
	repeat (10)
	{
		with (instance_create(x, y, obj_juicedebris))
		{
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			image_speed = 0;
			sprite_index = spr_juicedebris;
			image_index = i;
		}
	}
	scr_sound(sfx_glassbreak);
}
switch (global.combo)
{
	case 0:
	case 1:
		scr_sound(sound_combo1);
		break;
	case 2:
		scr_sound(sound_combo2);
		break;
	case 3:
		scr_sound(sound_combo3);
		break;
	default:
		scr_sound(sound_combo4);
		break;
}
instance_destroy();
