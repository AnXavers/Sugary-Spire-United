player = instance_find(obj_player, 0)
if (player != noone)
{
    elapsed_time += delta_time
    offline_timer += 0
    obj_online_receiver.online_timeout += (delta_time / 1000000)
    if (!connected && offline_timer > 15)
    {
        show_message("Failed to connect to main server, you're now playing in solo mode.")
    }
    if (connected && obj_online_receiver.online_timeout > 15)
        disconnect_from_server()
    var tick_rate = 75
    if (elapsed_time >= (1000000 / tick_rate))
    {
        elapsed_time = 0
        var msg_type = 1
        socket_send([[5, msg_type], [8, player.x], [8, player.y], [5, player.sprite_index], [5, player.image_index], [const_s16, player.xscale], [const_s16, player.visible], [5, room], [const_u16, player.state], [const_f16, player.hsp], [const_f16, player.vsp]])
    }
}