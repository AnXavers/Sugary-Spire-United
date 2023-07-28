function scr_enemy_eyescreamwait()
{
	image_speed = 0.35;
	vsp = 20;
	if (global.panic == 0)
		sprite_index = spr_eyescreamsandwich_wait;
	else if (global.panic == 1 && grounded && sprite_index != spr_eyescreamsandwich_popout && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))))
	{
		image_index = 0;
		sprite_index = spr_eyescreamsandwich_popout;
	}
	if (sprite_index == spr_eyescreamsandwich_popout && animation_end())
	{
		state = enemystates.eyescream;
		sprite_index = spr_eyescreamsandwich;
		movespeed = 8;
		vsp = 0;
	}
}
