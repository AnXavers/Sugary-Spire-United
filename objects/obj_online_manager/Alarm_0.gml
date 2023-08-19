if (!instance_exists(player))
{
    alarm[0] = 1
    return "";
}
local_name_text = instance_create(x, (y - 32), obj_online_nametag)
local_name_text.textcolor = obj_online_data.color
username = string_upper(username)
local_name_text.text = username
player.color = obj_online_data.color
player.name_text = local_name_text
local_name_text.target = player
local_name_text.special = obj_online_data.special
name_set = 1
