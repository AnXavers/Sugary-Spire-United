if (instance_number(object_index) > 1)
    instance_destroy()
else
{
    global.playerinroom = 0
    global.online_manager = id
    major_version = 0
    minor_version = 5
    build_version = 5
    password = 303174162
    version_approved = 0
    offline_timer = 0
    iterat_online = 0
    username = ""
    player = 528
    testbuild = 0
    local_name_text = 0
    var experimental = 0
    ifexperimental = experimental
    with (global.online_data)
    {
        other.ip = ip
        other.port = port
        other.guid = guid
        other.character = character
    }
    elapsed_time = 0
    sock = network_create_socket(0)
    global.socket = sock
    result = network_connect_raw(sock, ip, port)
    if (result < 0)
    {
        show_message("Failed to connect to main server, you're now playing in solo mode.")
    }
    connected = 1
    var buffer_password = buffer_create(4, buffer_grow, 1)
    buffer_write(buffer_password, buffer_u32, password)
    network_send_raw(sock, buffer_password, buffer_get_size(buffer_password))
    buffer_delete(buffer_password)
    socket_signin()
    instance_create(x, y, obj_online_sounds)
    instance_create(x, y, obj_online_panic)
    instance_create(x, y, obj_online_destruction)
    instance_create(x, y, obj_online_palette)
    instance_create(x, y, obj_online_chat)
    instance_create(x, y, obj_online_receiver)
    instance_create(x, y, obj_online_packet_manager)
    global.online_players = ds_map_create()
    var version_text = ((((((" |V" + string(major_version)) + ".") + string(minor_version)) + ".") + string(build_version)) + "|")
    name_set = 0
    debug_switch = 0
}
function socket_send(argument0) //gml_Script_socket_send
{
    if obj_online_data.connected
    {
        var buff_size = 0
        var args = argument0
        for (var i = 0; i < array_length(args); i++)
            buff_size += buffer_sizeof(args[i][0])
        var buffer = buffer_create(buff_size, buffer_fixed, 1)
        for (i = 0; i < array_length(args); i++)
            buffer_write(buffer, args[i][0], args[i][1])
        network_send_raw(obj_online_data.sock, buffer, buff_size)
        buffer_delete(buffer)
    }
}

function socket_send_chat(argument0) //gml_Script_socket_send_chat
{
    if connected
    {
        var txt = argument0
        buffer = buffer_create(104, buffer_grow, 1)
        var msg_type = 8
        buffer_write(buffer, buffer_u32, msg_type)
        buffer_write(buffer, buffer_string, txt)
        var current_size = buffer_tell(buffer)
        for (i = current_size; i < 104; i++)
            buffer_write(buffer, buffer_u8, 0)
        network_send_raw(sock, buffer, buffer_get_size(buffer))
        buffer_delete(buffer)
    }
}

function socket_send_error(argument0) //gml_Script_socket_send_error
{
    buffer = buffer_create(512, buffer_fixed, 1)
    msg_type = 9
    buffer_write(buffer, buffer_u32, msg_type)
    buffer_write(buffer, buffer_string, argument0)
    network_send_raw(global.socket, buffer, 512)
    buffer_delete(buffer)
}

function socket_signin() //gml_Script_socket_signin
{
    var buffer_guid = buffer_create(40, buffer_grow, 1)
    guid = string_replace(obj_online_data.guid, " ", "")
    msg_type = 10
    buffer_write(buffer_guid, buffer_u32, msg_type)
    buffer_write(buffer_guid, buffer_string, guid)
    network_send_raw(sock, buffer_guid, 40)
    buffer_delete(buffer_guid)
}

const_u8 = 1
const_s8 = 2
const_u16 = 3
const_s16 = 4
const_u32 = 5
const_s32 = 6
const_u64 = 12
const_f16 = 7
const_f32 = 8
const_f64 = 9
const_bool = 10
function try_buffer_read(argument0, argument1, argument2) //gml_Script_try_buffer_read
{
    buffer = argument0
    var type = argument1
    var default_value = argument2
    var bytes_size = buffer_sizeof(type)
    if ((buffer_tell(buffer) + bytes_size) > buffer_get_size(buffer))
    {
        buffer_seek(buffer, buffer_seek_end, 0)
        return default_value;
    }
    else
        return buffer_read(buffer, type);
}

function disconnect_from_server() //gml_Script_disconnect_from_server
{
    connected = 0
    show_message("Connection with the server timed out, you're now in solo mode")
    network_destroy(global.socket)
    var onlinePlayerCount = instance_number(obj_online_player)
    if (onlinePlayerCount > 0)
    {
        for (i = (onlinePlayerCount - 1); i >= 0; i--)
        {
            var onlinePlayer = instance_find(obj_online_player, i)
            instance_destroy(onlinePlayer)
        }
    }
}

function __game_restart() //gml_Script___game_restart
{
    stop_music()
	audio_stop_all()
    with (all)
        instance_destroy()
    draw_texture_flush()
}

