global.online_baddies = id
max_kill_distance = 50
function send_online_baddie_kill(argument0, argument1) //gml_Script_send_online_baddie_kill
{
    if obj_online_data.shared_baddies
    {
        var inst_id = argument0
        var obj_id = argument1
        var msg_type = 5
        with (obj_online_manager)
            socket_send([[const_u32, msg_type], [const_u32, inst_id], [const_u32, obj_id]])
    }
}

function kill_online_baddie(argument0, argument1, argument2) //gml_Script_kill_online_baddie
{
    if obj_online_data.shared_baddies
    {
        var inst_id = argument0
        var obj_id = argument1
        if (obj_id == obj_painter || obj_coneball)
            return;
        if (inst_id != undefined && obj_id != undefined && instance_exists(inst_id) && instance_exists(obj_id))
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
                if (distance_to_point(caller.x, caller.y) < other.max_kill_distance)
                    instance_destroy()
            }
        }
    }
}

