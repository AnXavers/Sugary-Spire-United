global.online_destruction = id
player = 0
max_destruction_distance = 50
function send_online_destruction(argument0, argument1) //gml_Script_send_online_destruction
{
    if obj_online_data.shared_destruction
    {
        var inst_id = argument0
        var obj_id = argument1
        var msg_type = 4
        with (obj_online_manager)
            socket_send([[const_u32, msg_type], [const_u32, inst_id], [const_u32, obj_id]])
    }
}

function destroy_online_destructable(argument0, argument1, argument2) //gml_Script_destroy_online_destructable
{
    if obj_online_data.shared_destruction
    {
        var inst_id = argument0
        var obj_id = argument1
        if (instance_exists(inst_id) && instance_exists(obj_id))
        {
            with (inst_id)
            {
                if (object_index == obj_id)
                {
                    instance_destroy()
                    return;
                }
            }
        }
        var caller = argument2
        var inst = instance_nearest(caller.x, caller.y, obj_id)
        if (inst != noone)
        {
            with (inst)
            {
                if (distance_to_point(caller.x, caller.y) < other.max_destruction_distance)
                    instance_destroy()
            }
        }
    }
}

