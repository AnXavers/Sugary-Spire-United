if (live_call()) return live_result;
audio_stop_sound(sfx_harrypause)
with (instance_create(x, y, obj_harrydead))
	paletteselect = other.paletteselect;
instance_create(0, 0, obj_sugarrush);
global.panic = 1;
var time_array = scr_escapetimes();
global.fill = time_in_frames(time_array[0], time_array[1]);
obj_tv.target_fill = global.fill;
global.wave = 0;
global.maxwave = global.fill;
if !instance_exists(obj_panicchanger)
	instance_create(x, y, obj_panicchanger);
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
if (set_theme != -4)
	obj_music.escapemusic = set_theme;
global.combofreeze = 30;
global.combotime = 60;
obj_camera.cam_lzoom = 1;
audio_pause_all()
scr_sound(sound_explosion)
screen_flash(1)
layer_destroy(global.harryeffect)
global.freezeframetimer = 5
instance_destroy()