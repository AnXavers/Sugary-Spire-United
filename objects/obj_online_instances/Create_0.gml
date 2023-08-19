global.online_instances = id
function online_instance_create(argument0, argument1, argument2) //gml_Script_online_instance_create
{
    var xval = argument0
    var yval = argument1
    var obj_id = argument2
    var msg_type = 11
    with (obj_online_manager)
        socket_send([[const_u32, msg_type], [const_f32, xval], [const_f32, yval], [const_s32, obj_id]])
}

