if (type == "Fragile")
	grabbedspr = spr_iceblock_fragile;
if (type == "Heavy")
{
	grabbedspr = spr_iceblock_heavy;
	grav2 = 0.7;
}
if (room == sucrose_6 || room == sucrose_6_1 || room == sucrose_7 || room == sucrose_8)
{
	color_index = 1;
	color = 
	{
		light: 7490854,
		dark: 0
	};
}
if (content != -4)
{
	contentspr = object_get_sprite(content);
	if (contentspr == spr_bigcollect1P)
	{
		switch obj_player.character
		{
			case "N":
				contentspr = choose(spr_bigcollect1N, spr_bigcollect2N, spr_bigcollect3N);
			case "S":
			case "T":
			case "V":
			case "M":
				contentspr = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5);
			default:
				contentspr = choose(spr_bigcollect1P, spr_bigcollect2P, spr_bigcollect3P, spr_bigcollect4P, spr_bigcollect5P, spr_bigcollect6P);
		}
	}
}
if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
