if (global.panic == 1)
{
	if (state != 15)
	{
		instance_destroy();
		instance_create(x, y, obj_bombexplosion);
		other.state = 22;
		other.bombpeptimer = 0;
		other.sprite_index = spr_bombpep_end;
		other.image_index = 0;
		instance_create(x, y, obj_bombexplosioncherry);
	}
	else if (other.instakillmove && sprite_index == spr_charcherry_popout)
		instance_destroy();
}
