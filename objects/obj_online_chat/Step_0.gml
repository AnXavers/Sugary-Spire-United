text.x = player.x
text.y = (player.y - 70)
text.visible = player.visible
chat_delay += (delta_time / 1000000)
if (!global.onlinemodeon)
    write_state = 0
with (player)
{
    if other.write_state
        other.text.text = (global.oldsmallfont_chat ? keyboard_string : string_upper(keyboard_string))
    else
        other.text.text = ""
    if ((!other.write_state) && key_talk && (!obj_debugcontroller.active) && obj_pause.pause != 1)
    {
        if ((state == states.normal && state != states.backbreaker))
        {
            image_index = 0
            other.chat_delay = 0
            other.local_message = ""
            hsp = 0
            if (!isgustavo)
                sprite_index = spr_talkidle
            else
                sprite_index = spr_player_ratmountidle2
            state = states.backbreaker
            keyboard_string = ""
            other.write_state = 1
        }
    }
    if (other.write_state && keyboard_check_pressed(vk_return) && other.chat_delay > 0.2 && (!obj_debugcontroller.active) && obj_pause.pause != 1)
    {
        image_index = 0
        if (!isgustavo)
            sprite_index = spr_talksent
        else
            sprite_index = spr_player_ratmountspit
        other.write_state = 0
        other.alarm[1] = 15
        if (keyboard_string != "")
        {
            if (string_copy(keyboard_string, 1, 11) == "/getwebspr " && obj_online_data.registered)
            {
                var argswspr = string_copy(keyboard_string, 12, string_length(keyboard_string))
                if file_exists("PTUCEContent/sprites/sprite.zip")
                {
                    file_delete("PTUCEContent/sprites/sprite.zip")
                    directory_destroy("PTUCEContent/sprites/sprite_extr/")
                }
                download_sprite(argswspr)
            }
            if (string_copy(keyboard_string, 1, 13) == "/applywebspr" && obj_online_data.registered)
            {
                with (obj_online_sprites)
                {
                    var jsonfile = "PTUCEContent/sprites/sprite_extr/config.json"
                    var _buffer = buffer_load(jsonfile)
                    var json = buffer_read(_buffer, buffer_string)
                    var jsondata = json_parse(json)
                    buffer_delete(_buffer)
                    var spr_toreplace = -4
                    var frameamount = -4
                    var origx = -4
                    var origy = -4
                    for (var file_name = file_find_first("PTUCEContent/sprites/sprite_extr/", 0); file_name != ""; file_name = file_find_next())
                        spr_filename = file_name
                    for (i = 0; i < array_length(jsondata); i++)
                    {
                        spr_toreplace = jsondata[i].Name
                        frameamount = jsondata[i].TextureCount
                        origx = jsondata[i].Origin_X
                        origy = jsondata[i].Origin_Y
                        sprite_replace(asset_get_index(spr_toreplace), (("PTUCEContent/sprites/sprite_extr/" + spr_toreplace) + ".png"), frameamount, false, false, origx, origy)
                    }
                }
            }
            var msg = (global.oldsmallfont_chat ? keyboard_string : string_upper(keyboard_string))
            if (!obj_online_data.registered)
                msg = "YOU MUST BE REGISTERED TO USE THE CHAT"
            other.local_message = msg
            other.text.text = other.local_message
            if (string_byte_length(msg) <= 100)
            {
                var me_player = id
                with (global.online_chat)
                    show_chat_message(msg, me_player)
                with (global.online_manager)
                    socket_send_chat(msg)
            }
        }
        else
        {
            other.local_message = ""
            keyboard_string = ""
        }
    }
}
