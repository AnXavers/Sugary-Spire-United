if (obj_player.state == 91)
{
	obj_player.state = 1;
	obj_tv.staticdraw = true;
	obj_tv.statictimer = 20;
	if (!instance_exists(obj_tasershockwave))
		instance_create(x, y, obj_tasershockwave);
}
if (obj_player.state == 92)
{
	obj_player.state = 1;
	obj_tv.staticdraw = true;
	obj_tv.statictimer = 20;
}
