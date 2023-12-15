image_xscale = obj_player.xscale;
if ((obj_player.state != states.pizzano_rocketfist && sprite_index != obj_player.spr_crouchslide)  && obj_player.state != states.machroll && (sprite_index != obj_player.spr_mach3rollstart|| sprite_index != obj_player.spr_mach3roll))
	instance_destroy();
if (obj_player.state != states.minecart)
	x = obj_player.x + (42 * obj_player.xscale);
y = obj_player.y;
depth = obj_player.depth - 6;
if (obj_player.sprite_index == obj_player.spr_dive || obj_player.sprite_index == obj_player.spr_machroll  || obj_player.sprite_index == obj_player.spr_crouchslide || obj_player.movespeed < 12)
	instance_destroy();