if (global.panic == 1)
{
	if (state != enemystates.cherrywait)
	{
		instance_destroy();
		instance_create(x, y, obj_bombexplosion);
		other.state = states.bombpep;
		other.bombpeptimer = 0;
		other.sprite_index = spr_pizzelle_bombend;
		other.image_index = 0;
		instance_create(x, y, obj_bombexplosioncherry);
	}
	else if (other.instakillmove && sprite_index == spr_charcherry_popout)
		instance_destroy();
}
