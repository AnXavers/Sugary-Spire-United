instance_create(0, 0, obj_sugarrush);
global.panic = 1;
var time_array = scr_escapetimes();
global.fill = time_in_frames(time_array[0], time_array[1]);
obj_tv.target_fill = global.fill;
global.wave = 0;
global.maxwave = global.fill;
if !instance_exists(obj_panicchanger)
	instance_create(x, y, obj_panicchanger);
audio_stop_sound(sfx_harrypause)
if (set_theme != -4)
	obj_music.escapemusic = set_theme;
global.combofreeze = 30;
global.combotime = 60;
instance_destroy(obj_cameraRegion)
audio_pause_all()
scr_sound(sound_explosion)
screen_flash(3)
layer_destroy(global.harryeffect)
switch (global.combo)
{
	case 0:
	case 1:
		scr_sound(sound_combo1);
		break;
	case 2:
		scr_sound(sound_combo2);
		break;
	case 3:
		scr_sound(sound_combo3);
		break;
	default:
		scr_sound(sound_combo4);
		break;
}
vsp = random_range(-5, -10);
hsp = sign(x - obj_player.x) * random_range(5, 10);
grav = 0.4;
alarm[0] = 5;