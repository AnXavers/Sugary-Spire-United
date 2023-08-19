global.online_chat = id
player = obj_player
text = instance_create(player.x, player.y, obj_text)
text.persistent = 1
local_message = ""
write_state = 0
alarm[0] = 180
chat_delay = 0
colored_chat = 0
function show_chat_message(argument0, argument1) //gml_Script_show_chat_message
{
    var msg = argument0
    var target_player = argument1
    var bubble = instance_create(x, y, obj_online_chat_bubble)
    if colored_chat
        bubble.textcolor = argument1.color
    bubble.target = target_player
    bubble.text = msg
}

function show_announcement(argument0) //gml_Script_show_announcement
{
    msg = argument0
    bubble = instance_create(x, y, obj_online_announcement)
    bubble.text = msg
}