function state_player_hurt()
{
	if (sprite_index == spr_hurtjump)
		hsp = xscale * movespeed;
	else if (sprite_index == spr_pizzelle_hurt)
		hsp = -xscale * movespeed;
	if (movespeed > 0)
		movespeed -= 0.1;
	combo = 0;
	mach2 = 0;
	bounce = 0;
	jumpAnim = 1;
	dashAnim = 1;
	if (grounded)
		landAnim = 0;
	else
		landAnim = 1;
	jumpstop = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	hurted = 1;
	turning = 0;
	alarm[5] = 2;
	alarm[7] = 60;
	if (alarm[8] == -1)
		alarm[8] = 120;
	if (grounded && vsp > 0)
		vsp = -4;
	if (scr_solid(x + hsp, y))
		xscale *= -1;
	image_speed = 0.35;
	if (ridingmarsh)
	{
		with (instance_create(x, y, obj_cookiemount))
		{
			image_xscale = obj_player.xscale;
			sprite_index = spr_cookiemounthurt;
			vsp = -8;
			hsp = -image_xscale * 8;
			var _sfx = scr_sound(sfx_dogmount_ride)
			audio_sound_pitch(_sfx, 1.20)
		}
		ridingmarsh = false;
	}
}
