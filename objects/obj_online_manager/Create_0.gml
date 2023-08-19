jumpscare = 0
sound_id = 0
if (instance_number(object_index) > 1)
    instance_destroy()
else
{
    last_player_data = -4
    global.online_manager = id
    major_version = obj_online_data.major_version
    minor_version = obj_online_data.minor_version
    build_version = obj_online_data.build_version
    password = 303174162
    version_approved = 0
	param_value = 0
    offline_timer = 0
    iterat_online = 0
    username = ""
    spray = 0
    spray_delay_time = 5
    spray_delay = 0
    player = obj_player
    testbuild = obj_online_data.testbuild
    local_name_text = 0
    var experimental = obj_online_data.ifexperimental
    ifexperimental = experimental
    with (global.online_data)
    {
        if (global.onlinemodeon == 1)
        {
            other.ip = ip
            other.port = port
            other.guid = guid
            other.character = character
        }
        else
        {
            other.ip = 0
            other.port = 0
            other.guid = 0
            other.character = character
        }
    }
    elapsed_time = 0
    sock = network_create_socket(0)
    global.socket = sock
    result = network_connect_raw(sock, ip, port)
    if (global.onlinemodeon == 1)
    {
        if (result < 0)
            show_message("Failed to connect main server.\n Check server status at our discord: discord.gg/ptu \n You're now in solo mode")
    }
    connected = 1
    var buffer_password = buffer_create(4, buffer_grow, 1)
    buffer_write(buffer_password, buffer_u32, password)
    network_send_raw(sock, buffer_password, buffer_get_size(buffer_password), 0)
    buffer_delete(buffer_password)
    socket_signin()
    instance_create_unique(x, y, obj_online_sounds)
    instance_create_unique(x, y, obj_online_panic)
    instance_create_unique(x, y, obj_online_destruction)
    instance_create_unique(x, y, obj_online_baddies)
    instance_create_unique(x, y, obj_online_palette)
    instance_create_unique(x, y, obj_online_receiver)
    instance_create_unique(x, y, obj_online_packet_manager)
    instance_create_unique(x, y, obj_online_instances)
    instance_create_unique(x, y, obj_online_sprites)
    instance_create_unique(x, y, obj_online_playercounter)
    global.online_players = ds_map_create()
    global.gamemodes = ds_map_create()
    var version_text = ((((((" |V" + string(major_version)) + ".") + string(minor_version)) + ".") + string(build_version)) + "|")
    name_set = 0
    debug_switch = 0
    alarm[1] = 300
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
