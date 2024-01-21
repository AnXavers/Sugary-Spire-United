if (instance_exists(obj_baddie) && !(global.lapmode == 1 && global.lapcount >= 3))
{
	obj_baddie.eliteEnemy = 0;
	obj_baddie.paletteselect = 0;
	if instance_exists(obj_cottonwitch) && obj_player.character == "N"
		obj_baddie.paletteselect = 2;
}
