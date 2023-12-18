if instance_exists(obj_baddie)
{
	obj_baddie.eliteEnemy = 1;
	if sprite_get_width(obj_baddie.spr_palette) > 1
		obj_baddie.paletteselect = 1;
}