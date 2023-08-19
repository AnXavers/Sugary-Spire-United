global.online_panic = id
function start_online_panic() //gml_Script_start_online_panic
{
    if obj_online_data.shared_panic
    {
        var pillar = instance_find(obj_gummyharry, 0)
        if (pillar != noone)
        {
            with (pillar)
                instance_destroy()
        }
    }
}

function send_online_panic() //gml_Script_send_online_panic
{
    var msg_type = 3
    with (obj_online_manager)
        socket_send([[const_u32, msg_type]])
}

