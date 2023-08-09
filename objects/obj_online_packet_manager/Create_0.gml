init_settings = 1
function packet_received(argument0, argument1) //gml_Script_packet_received
{
    var buffer = argument0
    var msg_type = argument1
    if (msg_type == 1)
    {
        var online_id = buffer_read(buffer, buffer_u32)
        var selected_color = buffer_read(buffer, buffer_s32)
        var special_role = buffer_read(buffer, buffer_u32)
        var palette_id = buffer_read(buffer, buffer_s32)
        var palette_texture = buffer_read(buffer, buffer_s32)
        var online_instance = instance_create(x, y, obj_online_player)
        var offset = buffer_tell(buffer)
        var name = buffer_read(buffer, buffer_string)
        buffer_seek(buffer, buffer_seek_start, (offset + 64))
        with (online_instance)
            set_online_palette(palette_id, palette_texture)
        online_instance.color = selected_color
        online_instance.special = special_role
        online_instance.name_text.special = special_role
        online_instance.username = name
        online_instance.name_text.text = name
        online_instance.online_id = online_id
        ds_map_add(global.online_players, online_id, online_instance)
    }
    if (msg_type == 2)
    {
        online_id = buffer_read(buffer, buffer_u32)
        if ds_map_exists(global.online_players, online_id)
        {
            online_instance = ds_map_find_value(global.online_players, online_id)
            ds_map_delete(global.online_players, online_id)
            instance_destroy(online_instance)
        }
    }
    if (msg_type == 3 || msg_type == 10)
    {
        var players_count = buffer_read(buffer, buffer_u32)
        for (var i = 0; i < players_count; i++)
        {
            if (players_count > 4096)
            {
                socket_send_error(("player update count error: " + string(players_count)))
                i = players_count
            }
            online_id = buffer_read(buffer, buffer_u32)
            var player_msg_type = buffer_read(buffer, buffer_u32)
            if (player_msg_type == -1)
                i = players_count
            if (player_msg_type == 1)
            {
                var xpos = buffer_read(buffer, buffer_f32)
                var ypos = buffer_read(buffer, buffer_f32)
                var spriteindx = buffer_read(buffer, buffer_u32)
                var imgindx = buffer_read(buffer, buffer_u32)
                var imgxscale = buffer_read(buffer, buffer_s16)
                var isvis = buffer_read(buffer, buffer_s16)
                var p_room = buffer_read(buffer, buffer_s32)
                var p_state = buffer_read(buffer, buffer_u16)
                var hsp = buffer_read(buffer, buffer_f16)
                var vsp = buffer_read(buffer, buffer_f16)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (online_instance)
                        update_online_player(xpos, ypos, spriteindx, imgindx, imgxscale, isvis, p_room, p_state, hsp, vsp)
                }
            }
            if (player_msg_type == 2)
            {
                var sound_id = buffer_read(buffer, buffer_u32)
                var sound_action = buffer_read(buffer, buffer_u32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (online_instance)
                        play_sound(sound_id, sound_action)
                }
            }
            if (player_msg_type == 3)
            {
                with (global.online_panic)
                    start_online_panic()
            }
            if (player_msg_type == 4)
            {
                var inst_id = buffer_read(buffer, buffer_u32)
                var obj_id = buffer_read(buffer, buffer_u32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (global.online_destruction)
                        destroy_online_destructable(inst_id, obj_id, online_instance)
                }
            }
            if (player_msg_type == 5)
            {
                inst_id = buffer_read(buffer, buffer_u32)
                obj_id = buffer_read(buffer, buffer_u32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (global.online_baddies)
                        kill_online_baddie(inst_id, obj_id, online_instance)
                }
            }
            if (player_msg_type == 6)
            {
                sound_id = buffer_read(buffer, buffer_u32)
                var sound_param_id = buffer_read(buffer, buffer_u32)
                var sound_param_val = buffer_read(buffer, buffer_u32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (online_instance)
                        set_sound_param(sound_id, sound_param_id, sound_param_val)
                }
            }
            if (player_msg_type == 7)
            {
                palette_id = buffer_read(buffer, buffer_s32)
                palette_texture = buffer_read(buffer, buffer_s32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (online_instance)
                        set_online_palette(palette_id, palette_texture)
                }
            }
            if (player_msg_type == 8)
            {
                offset = buffer_tell(buffer)
                var chat_message = buffer_read(buffer, buffer_string)
                buffer_seek(buffer, buffer_seek_start, (offset + 100))
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    with (global.online_chat)
                        show_chat_message(chat_message, online_instance)
                }
            }
            if (player_msg_type == 11)
            {
                var checkforthissopeoplewontabuseitIAMWATCHINGYOU = obj_shotgunblast
                var xval = buffer_read(buffer, buffer_f32)
                var yval = buffer_read(buffer, buffer_f32)
                var obj_index = buffer_read(buffer, buffer_s32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    if (obj_index == checkforthissopeoplewontabuseitIAMWATCHINGYOU && obj_online_data.shared_baddies && obj_online_data.shared_sounds && (!is_bossroom()))
                    {
                        with (instance_create(xval, yval, obj_index))
                            image_xscale = online_instance.image_xscale
                    }
                }
            }
            if (player_msg_type == 14)
            {
                var character_number = buffer_read(buffer, buffer_u32)
                var character = ""
                with (obj_online_character)
                    character = get_online_character(character_number)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    online_instance.character = character
                }
            }
            if (player_msg_type == 15)
            {
                var laps_number = buffer_read(buffer, buffer_u32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    online_instance.laps = laps_number
                }
            }
            if (player_msg_type == 16)
            {
                var hp = buffer_read(buffer, buffer_u32)
                if ds_map_exists(global.online_players, online_id)
                {
                    online_instance = ds_map_find_value(global.online_players, online_id)
                    online_instance.hp = hp
                }
            }
        }
    }
    if (msg_type == 5)
        ping = 1
    if (msg_type == 6)
    {
        var major = buffer_read(buffer, buffer_s32)
        var minor = buffer_read(buffer, buffer_s32)
        var build = buffer_read(buffer, buffer_s32)
        var major_version = obj_online_manager.major_version
        var minor_version = obj_online_manager.minor_version
        var build_version = obj_online_manager.build_version
        if (major_version < major || (major_version == major && minor_version < minor) || (major_version == major && minor_version == minor && build_version < build))
        {
            var my_version = ((((string(major_version) + ".") + string(minor_version)) + ".") + string(build_version))
            var server_version = ((((string(major) + ".") + string(minor)) + ".") + string(build))
            show_message((((("Version " + server_version) + " is available, please update to the new version.\nYour version (") + my_version) + ") is no longer supported.\nDownload the newer version in our discord:"))
        }
    }
    if (msg_type == 8 && obj_online_manager.username != "")
        show_message("Failed to log-in, please try again")
    if (msg_type == 9 && obj_online_manager.username != "")
        show_message("Logged in, restart your game to sync with your discord settings")
    if (msg_type == 9 && obj_online_manager.username == "")
    {
        var my_id = buffer_read(buffer, buffer_u32)
        obj_player.online_id = my_id
        var color_input = buffer_read(buffer, buffer_s32)
        var login_info = buffer_read(buffer, buffer_u32)
        with (obj_online_data)
        {
            registered = (login_info & 1) != 0
            special = (login_info & 2) != 0
            color = color_input
        }
        offset = buffer_tell(buffer)
        obj_online_manager.username = buffer_read(buffer, buffer_string)
        buffer_seek(buffer, buffer_seek_start, (offset + 64))
        connected = 1
        obj_online_manager.alarm[0] = 90
    }
    if (msg_type == 11)
    {
        var seconds = buffer_read(buffer, buffer_s32)
        var const_step = 12
        var step_seconds = (seconds * const_step)
        obj_online_panic.alarm[0] = step_seconds
    }
    if (msg_type == 12)
    {
        offset = buffer_tell(buffer)
        var announcment = buffer_read(buffer, buffer_string)
        buffer_seek(buffer, buffer_seek_start, (offset + 100))
        with (global.online_chat)
            show_announcement(announcment)
    }
    if (msg_type == 13)
    {
        var gamemode_type = buffer_read(buffer, buffer_u16)
        var gamemode_id = buffer_read(buffer, buffer_u32)
        var gamemode = noone
        switch gamemode_type
        {
            case 1:
                gamemode = instance_create(x, y, obj_online_g_race)
                break
            case 2:
                gamemode = instance_create(x, y, obj_online_g_pizzagal)
                break
            case 3:
                gamemode = instance_create(x, y, obj_online_g_richrace)
                break
            default:
                gamemode = instance_create(x, y, obj_online_gamemode)
        }

        players_count = buffer_read(buffer, buffer_u16)
        var owner_id = -4
        for (i = 0; i < players_count; i++)
        {
            online_id = buffer_read(buffer, buffer_u32)
            if ds_map_exists(global.online_players, online_id)
            {
                var player_instance = ds_map_find_value(global.online_players, online_id)
                array_push(gamemode.players, player_instance)
                if (i == 0)
                    owner_id = player_instance
            }
        }
        ds_map_add(global.gamemodes, gamemode_id, gamemode)
        with (gamemode)
        {
            g_id = gamemode_id
            g_type = gamemode_type
            owner = owner_id
        }
    }
    if (msg_type == 14)
    {
        gamemode_id = buffer_read(buffer, buffer_u32)
        if ds_map_exists(global.gamemodes, gamemode_id)
        {
            gamemode = ds_map_find_value(global.gamemodes, gamemode_id)
            instance_destroy(gamemode)
        }
    }
    if (msg_type == 15)
    {
        offset = buffer_tell(buffer)
        var close_message = buffer_read(buffer, buffer_string)
        buffer_seek(buffer, buffer_seek_start, (offset + 100))
        if (close_message != "")
            show_message(close_message)
        game_end()
    }
    if (msg_type == 18)
    {
        var selected_character_u32 = buffer_read(buffer, buffer_u32)
        var selected_character = get_online_character(selected_character_u32)
        obj_player.character = selected_character
    }
    if (msg_type == 19)
    {
        var settings = buffer_read(buffer, buffer_u64)
        with (obj_online_data)
        {
            shared_destruction = (settings & 1) != 0
            shared_baddies = (settings & 2) != 0
            shared_sounds = (settings & 4) != 0
            shared_panic = (settings & 8) != 0
        }
        if (init_settings == 0)
            show_announcement("SETTINGS UPDATED!")
        else
            init_settings = 0
    }
}

