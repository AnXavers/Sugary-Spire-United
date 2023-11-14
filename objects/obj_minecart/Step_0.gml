if (place_meeting(x, y - 4, obj_player) && !place_meeting(x, y, obj_minedummycart) && obj_player.state != states.minecart)
{
	grabbedMinecart = true;
	global.combofreeze = 30;
	obj_player.state = states.minecart;
	if (obj_player.xscale == image_xscale)
		obj_player.movespeed = clamp(obj_player.movespeed, 3, 12);
	else
		obj_player.movespeed = clamp(obj_player.movespeed / 4, 3, 12);
	obj_player.vsp = vsp;
	obj_player.sprite_index = obj_player.spr_minecart_player;
	obj_player.x = x;
	obj_player.y = y;
	obj_player.xscale = image_xscale;
	if (!instance_exists(obj_poofeffect))
		instance_create(x, y, obj_poofeffect);
	var myButton1 = get_control_string(global.key_jump);
	scr_controlprompt("[spr_buttonfont]" + myButton1 + "[spr_promptfont] Jump" + "[spr_buttonfont]" + myButton1 + "[spr_promptfont] Dismount Minecart (In Air)");
}
if (obj_player.state == states.minecart || place_meeting(x, y, obj_minedummycart))
	image_alpha = 0.5;
else
	image_alpha = 1;
