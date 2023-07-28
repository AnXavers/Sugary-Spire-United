if (place_meeting(x, y + 1, obj_player) && obj_player.sprite_index == spr_bodyslamfall)
	instance_destroy();
global.switchactivated = 1;
