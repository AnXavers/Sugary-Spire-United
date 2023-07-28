collectvanish = false;
collectboxid = -4;
in_the_void = false;
depth = 2;
global.collected = 0;
global.collectsound = mu_entryway_title;
switch (obj_player.character)
{
	case "P":
		sprite_index = choose(spr_bigcollect1P, spr_bigcollect2P, spr_bigcollect3P, spr_bigcollect4P, spr_bigcollect5P, spr_bigcollect6P);
		break;
	case "N":
		sprite_index = choose(spr_bigcollect1N, spr_bigcollect2N, spr_bigcollect3N);
		break;
}
image_speed = 0.35;
gotowardsPlayer = false;
