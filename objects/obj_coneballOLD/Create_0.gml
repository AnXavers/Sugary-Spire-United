depth = -100;
coneballSound = audio_emitter_create();
audio_play_sound_on(coneballSound, sfx_coneball, false, 100);
audio_emitter_gain(coneballSound, global.soundVolume);
image_speed = 0.35;
coneballspeed = 1;
x = obj_player.x;
y = -100;
dis = 800;
mindis = 150;
dir = 0;
timer = 150;
attacking = false;
atktimer = 250;
projcool = 5;
fading = false;
alpha = 1;
attack = 1;
hurtplayer = function()
{
	with (obj_player)
	{
		if ((state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes) && cutscene == 0)
		{
		}
		else if (state == states.bombpep && hurted == 0)
		{
		}
		else if (state == states.boxxedpep)
		{
		}
		else if (state == states.cheesepep || state == states.cheesepepstick)
		{
		}
		else if (state != states.hurt && hurted == 0 && cutscene == 0 && state != states.bump && state != states.tumble)
		{
			scr_sound(sound_touchspike);
			global.hurtcounter++;
			alarm[8] = 60;
			alarm[7] = 120;
			hurted = 1;
			if (xscale == other.image_xscale)
				sprite_index = spr_hurtjump;
			else
				sprite_index = spr_pizzelle_hurt;
			movespeed = 8;
			vsp = -5;
			timeuntilhpback = 300;
			if (global.collect > 100)
				global.collect -= 100;
			else
				global.collect = 0;
			if (global.collect != 0)
			{
				repeat 12
					instance_create(x, y, obj_pizzaloss);
			}
			else if (obj_player.shotgunAnim == 1)
				obj_player.shotgunAnim = 0;
			instance_create(x, y, obj_spikehurteffect);
			state = states.hurt;
			if global.newvoicelines
				scr_sound(choose(sfx_newhurt1p, sfx_newhurt2p))
			image_index = 0;
			flash = 1;
			global.style -= 30;
		}
	}
};
if (global.panic == 0)
	instance_destroy();
