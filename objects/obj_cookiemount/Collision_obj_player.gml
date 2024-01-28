if (obj_player.state == 17 || obj_player.state == states.punch)
{
	if (obj_player.xscale == -1)
		obj_player.movespeed = -obj_player.movespeed;
	obj_player.ridingmarsh = true;
	obj_player.state = states.cookiemount;
	with (obj_dogtreat)
		instance_create(x, y, obj_poofeffect);
	instance_destroy();
	scr_sound(sfx_dogmount_ride)
	if global.dogtimer == 0
		global.dogtimer++
}
