function state_player_superslam()
{
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	hsp = move * movespeed;
	if (move != 0)
		movespeed = 5;
	else
		movespeed = 0;
	if (vsp >= 2)
	{
		vsp += 0.5;
		if (vsp > 17 && !instance_exists(obj_piledrivereffect))
			instance_create(x, y, obj_piledrivereffect, 
			{
				obj_player: id
			});
	}
	vsp = min(vsp, 40);
	freefallsmash += (vsp / 15);
	mach2 = 0;
	if (sprite_index == spr_piledriverstart && animation_end())
	{
		sprite_index = spr_piledriver;
		image_index = 0;
	}
	if (sprite_index == spr_piledriverstart || sprite_index == spr_piledriver)
	{
		move = key_left + key_right;
		hsp = move * movespeed;
	}
	else
	{
		move = 0;
		hsp = 0;
	}
	if ((sprite_index == spr_piledriver || sprite_index == spr_piledriverstart) && (grounded && !place_meeting(x, y + 1, obj_destructibles) && vsp > 0))
	{
		sprite_index = spr_piledriverland;
		scr_sound(sound_maximumspeedland);
		jumpAnim = 1;
		jumpstop = 0;
		image_index = 0;
		with (obj_camera)
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		hsp = 0;
		bounce = 0;
		with (instance_create(x, y + 35, obj_bangeffect))
			xscale = obj_player.xscale;
		instance_create(x, y, obj_landcloud);
		freefallstart = 0;
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				image_index = 0;
				vsp = -7;
				hsp = 0;
			}
		}
		if (instance_exists(baddiegrabbedID))
		{
			with (baddiegrabbedID)
			{
				scr_sound(sound_killingblow);
				instance_create(x, y, obj_slapstar);
				instance_create(x, y, obj_baddiegibs);
				flash = 1;
				global.combotime = 60;
				global.hit++;
				alarm[1] = 5;
				thrown = 1;
				x = obj_player.x;
				y = obj_player.y;
				hsp = other.xscale * 10;
				vsp = -10;
				hp = 0;
				thrown = true;
				state = 6;
				if (object_index == obj_painter)
				{
					state = bossstates.hurt;
					movespeed = abs(hsp);
				}
				stunned = 500;
			}
		}
	}
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	machslideAnim = 1;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
	{
		vsp = -9;
		state = states.jump;
		if (character == "P")
			sprite_index = spr_machfreefall;
		if (character == "DEEZNUTS")
			sprite_index = spr_noise_jump;
	}
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.25;
		else if (floor(movespeed) == 5)
			movespeed = 6;
	}
	else
		movespeed = 0;
	if (movespeed > 6)
		movespeed -= 0.1;
	if (character == "DEEZNUTS" && move != 0)
		xscale = move;
	image_speed = 0.35;
}
