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
		if ((state == 19 || state == 20 || state == 13) && cutscene == 0)
		{
		}
		else if (state == 22 && hurted == 0)
		{
		}
		else if (state == 9)
		{
		}
		else if (state == 6 || state == 8)
		{
		}
		else if (state != 73 && hurted == 0 && cutscene == 0 && state != 72 && state != 96)
		{
			scr_sound(sound_touchspike);
			global.hurtcounter += 1;
			alarm[8] = 60;
			alarm[7] = 120;
			hurted = 1;
			if (xscale == other.image_xscale)
				sprite_index = spr_hurtjump;
			else
				sprite_index = spr_hurt;
			movespeed = 8;
			vsp = -5;
			timeuntilhpback = 300;
			if (global.collect > 100)
				global.collect -= 100;
			else
				global.collect = 0;
			if (global.collect != 0)
			{
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
				instance_create(x, y, obj_pizzaloss);
			}
			else if (obj_player.shotgunAnim == 1)
				obj_player.shotgunAnim = 0;
			instance_create(x, y, obj_spikehurteffect);
			state = 73;
			image_index = 0;
			flash = 1;
			global.style -= 15;
		}
	}
};
if (global.panic == 0)
	instance_destroy();
