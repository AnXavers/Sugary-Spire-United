function state_player_freefallland()
{
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	movespeed = 0;
	if (sprite_index != spr_donutSlam_land)
		facehurt = 1;
	start_running = 1;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	if (animation_end())
	{
		state = 1;
		sprite_index = spr_pizzelle_idle;
		freefallsmash = 0;
		if (key_jump2 && character == "N")
		{
			with (instance_create(x, y + 20, obj_bangeffect))
				sprite_index = spr_highjumpcloud2;
			sprite_index = spr_pizzelle_jump;
			image_index = 0;
			stopAnim = 1;
			jumpAnim = 1;
			vsp = -14;
			state = states.jump;
		}
	}
	image_speed = 0.35;
}
