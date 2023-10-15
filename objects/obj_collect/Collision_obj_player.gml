audio_stop_sound(obj_player.sfx_collect);
var a = scr_sound(obj_player.sfx_collect);
audio_sound_pitch(a, random_range(0.95, 1.1));
global.collect += 10;
global.pizzameter++;
create_small_number(x + 16, y + 16, "10");
global.combofreeze = clamp(global.combofreeze + 5, 0, 30);
global.combotime += 15;
with (instance_create(x, y, obj_collecteffect))
{
	sprite_index = other.sprite_index;
	col = other.col;
	choosed = true;
}
instance_destroy();
