if (instance_place(x, y - 1, obj_player) && (obj_player.state == states.cookiemount || obj_player.state = states.cookiemountattack || obj_player.state = states.cookiemountfireass))
{
	alarm[0] = 1;
	obj_player.state = states.normal;
	obj_player.movespeed = abs(obj_player.hsp);
	obj_player.ridingmarsh = false;
	global.dogtimer = 0
}
if (instance_place(x, y - 1, obj_cookiemount))
{
	instance_destroy(obj_cookiemount);
	alarm[0] = 1;
}
