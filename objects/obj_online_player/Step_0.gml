var out_of_bounds = (room != room_index && visible)
if ((room == rm_painterarena || room == rm_pizzanoarena || room == rm_coneballarena) && (!global.online_bosspvp))
    image_alpha = 0.35
else
    image_alpha = 1
visible = (room == room_index && should_be_visible)
if (visible && image_alpha >= 1)
{
    x += hsp
    y += vsp
    hsp = Approach(hsp, 0, 0.1)
    vsp = Approach(vsp, 0, 0.1)
    {
        var sound_value = ds_map_find_value(sounds, key)
        scr_sound(sound_value, x, y)
        key = ds_map_find_next(sounds, key)
    }
}
if (!visible)
{
    var mach_sound = 18
    sound_value = ds_map_find_value(sounds, mach_sound)
}
