player = instance_find(obj_player, 0)
if (player == noone)
{
    elapsed_time += delta_time
    var tick_rate = 75
    if (elapsed_time >= (1000000 / tick_rate) && last_player_data != -4)
    {
        elapsed_time = 0
        socket_send(last_player_data)
    }
}
else
{
    with (obj_player)
    {
        if (sign(xscale) > 3)
        {
            show_message((("xscale moment (" + string(xscale)) + ")"))
            xscale = sign(xscale)
        }
    }
    var rm = obj_cyop_manager.network_room
    elapsed_time += delta_time
    offline_timer += 0
    obj_online_receiver.online_timeout += (delta_time / 1000000)
    spray_delay -= (delta_time / 1000000)
    if (global.onlinemodeon == 1)
    {
        if ((!connected) && offline_timer > 15)
            show_message("Failed to connect main server.\n Check server status at our discord: discord.gg/ptu \n You're now in solo mode")
        if (connected && obj_online_receiver.online_timeout > 15)
        {
            connected = 0
            show_message("Connection with the server timed out, you're now in solo mode")
        }
    }
    tick_rate = 75
    if (elapsed_time >= (1000000 / tick_rate))
    {
        elapsed_time = 0
        var msg_type = 1
        last_player_data = [[5, msg_type], [8, player.x], [8, player.y], [5, map_sprite(player.sprite_index)], [5, player.image_index], [const_s16, player.xscale], [const_s16, player.visible], [5, rm], [const_u16, player.state], [const_f16, player.hsp], [const_f16, player.vsp]]
        socket_send(last_player_data)
    }
    if (keyboard_check_pressed(vk_tab) && (!obj_online_chat.write_state) && (!obj_debugcontroller.active) && (!obj_pause.pause))
    {
        with (obj_online_playercounter)
            vis = (!vis)
    }
    if ((sprite_get_width(obj_player.sprite_index) > 300 || sprite_get_height(obj_player.sprite_index) > 550) && jumpscare != 1)
    {
        if (obj_player.sprite_index != spr_playerPZ_supertaunt1 && obj_player.sprite_index != spr_playerPZ_supertaunt2 && obj_player.sprite_index != spr_playerPZ_supertaunt3 && obj_player.sprite_index != spr_playerBN_supertaunt1 && obj_player.sprite_index != spr_playerBN_supertaunt2 && obj_player.sprite_index != spr_playerBN_supertaunt3 && obj_player.sprite_index != spr_playerBN_supertaunt4)
        {
            obj_player.x = -500
            obj_player.y = -500
            obj_player.visible = false
            obj_player.state = states.titlescreen
            obj_player.hsp = 0
            obj_player.vsp = 0
            with (global.online_manager)
            {
                socket_send_chat(("ANTI CHEAT DETECTED SPRITE NAME " + string_upper(sprite_get_name(obj_player.sprite_index))))
                socket_send_chat(((("SIZE " + string_upper(sprite_get_width(obj_player.sprite_index))) + " X ") + string_upper(sprite_get_height(obj_player.sprite_index))))
            }
            jumpscare = 1
        }
    }
    if (obj_player.xscale > 3 || obj_player.xscale < -3)
    {
        obj_player.x = -500
        obj_player.y = -500
        obj_player.visible = false
        obj_player.state = states.titlescreen
        obj_player.hsp = 0
        obj_player.vsp = 0
        obj_player.xscale = 1
        with (global.online_manager)
        {
            socket_send_chat("ANTI CHEAT DETECTED XSCALE ABUSE")
            socket_send_chat(("XSCALE USER " + obj_online_manager.username))
        }
        jumpscare = 1
    }
    if (jumpscare == 1)
    {
        show_message("nice try dingus")
        game_end()
    }
}