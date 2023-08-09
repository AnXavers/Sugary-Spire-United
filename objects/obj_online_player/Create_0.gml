username = "%PLACEHOLDER%\r\n"
name_text = instance_create(x, (y - 32), obj_online_nametag)
name_text.persistent = 1
name_text.target = id
special = 0
online_id = 0
image_speed = 0.5
username = string_upper(username)
name_text.text = username
room_index = Loadiingroom
sounds = ds_map_create()
color = 4294967295
should_be_visible = 1
colorpalette = 1
texturepalette = -4
character = "P"
state = states.normal
xscale = 1
yup = 0
laps = 0
hsp = 0
vsp = 0
spr_palette = spr_pal
hp = 1
with (global.online_sounds)
{
    if obj_online_data.shared_sounds
    {
        var size = ds_map_size(player_sounds)
        var key = ds_map_find_first(player_sounds)
        for (var i = 0; i < size; i++)
        {
            var sound_id = ds_map_find_value(player_sounds, key)
            if (sound_id == 18)
            {
                var sound_name = get_sound(sound_id)
                var sound_instance = scr_sound(sound_name)
                var mach_sound = 1
                scr_sound(sound_instance)
                ds_map_add(other.sounds, sound_id, sound_instance)
            }
            key = ds_map_find_next(player_sounds, key)
        }
    }
}
function update_online_player(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //gml_Script_update_online_player
{
    should_be_visible = argument5
    room_index = argument6
    state = argument7
}