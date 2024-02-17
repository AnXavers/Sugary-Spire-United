draw_self();
if target == obj_gravplug
{
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	var _display_mins = string(frames_in_minutes(target.activetimer))
	var _display_secs = string(((frames_in_seconds(target.activetimer)) mod 60))
	if string_length(_display_secs) == 1
		_display_secs = ("0" + _display_secs)
	draw_text(x, y, _display_mins + ":" + _display_secs);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}