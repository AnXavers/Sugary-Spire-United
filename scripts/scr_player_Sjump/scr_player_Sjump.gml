function state_player_Sjump()
{
	hsp = 0;
	Sjumpcan_doublejump = false;
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	if (sprite_index == spr_player_superjump || sprite_index == spr_player_outofcontrolfall || sprite_index == spr_pizzano_sjump)
	{
		vsp = -movespeed;
		movespeed = approach(movespeed, 18, 1);
	}
	if (sprite_index == spr_pizzano_sjumpprep || sprite_index == spr_player_superjump_cancelprep)
		vsp = 0;
	if (sprite_index == spr_pizzano_sjumpprep && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_pizzano_sjump;
		scr_sound(sound_superjumprelease);
		vsp = -10;
	}
	if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_boxofpizza) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles) && sprite_index != spr_player_superjump_cancelprep)
	{
		scr_sound(sound_maximumspeedland);
		sprite_index = spr_player_superjumpland;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with (obj_baddie)
		{
			if (bbox_in_camera(view_camera[0]) && grounded)
			{
				image_index = 0;
				state = 0;
				vsp = -7;
				hsp = 0;
			}
		}
		image_index = 0;
		state = 52;
		machhitAnim = 0;
		movespeed = 0;
	}
	if ((key_attack2 || key_slap2) && !grounded && vsp < -10 && character == "P" && sprite_index != spr_player_superjump_cancelprep)
	{
		scr_sound(sound_superjumpcancel);
		image_index = 0;
		image_speed = 0.5;
		vsp = 0;
		sprite_index = spr_player_superjump_cancelprep;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_superjump_cancelprep)
	{
		if (move != 0)
			xscale = move;
		movespeed = 13;
		machhitAnim = 0;
		state = 70;
		flash = 1;
		vsp = -4;
		image_index = 0;
		sprite_index = spr_player_superjump_cancel;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
	if ((key_attack2 || key_slap2) && !grounded && vsp < -10 && character == "N")
	{
		scr_sound(sound_superjumpcancel);
		flash = 1;
		charged = 0;
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		vsp = 0;
		mach2 = 0;
		state = 104;
	}
	image_speed = 0.5;
	if (sprite_index == spr_player_superjump_cancelprep)
		image_speed = 0.5;
	scr_collision();
}
