scr_collision()
if !audio_is_playing(sfx_scratch) && !audio_is_playing(mu_breakdance)
{
	scr_soundloop(mu_breakdance)
	alarm[0] = (12 + irandom(3))
}
if obj_player.sprite_index != obj_player.spr_breakdance
{
	instance_create(x, y, obj_poofeffect)
	audio_stop_sound(mu_breakdance)
	alarm[0] = -1
	instance_destroy()
	obj_player.boombox_timer = -1
}
image_angle = scr_slopeanglenonplayer(x, y)