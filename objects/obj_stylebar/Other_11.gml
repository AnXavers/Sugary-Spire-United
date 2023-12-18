if (instance_exists(obj_baddie) && (global.lapcount < 3 || global.lapmode == 1))
{
	obj_baddie.eliteEnemy = 0;
	obj_baddie.paletteselect = 0;
	if instance_exists(obj_cottonwitch) && obj_player.character == "N"
		obj_baddie.paletteselect = 2;
}
