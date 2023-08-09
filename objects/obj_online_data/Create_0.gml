global.online_data = id
ini_open("network.ini")
ip = ini_read_string("network", "ip", "yoavhaik.com")
var port_old = ini_read_real("network", "port", 6346)
port = 6346
shared_panic = 1
shared_destruction = 1
shared_baddies = 1
shared_sounds = 1
special = 0
registered = 0
if ini_key_exists("player", "guid")
    guid = ini_read_string("player", "guid", "")
else
{
    var selected_guid = get_string("Enter your Peppibot discord assigned password or keep empty to sign anonymously:", "")
    if (selected_guid == "")
        selected_guid = ""
    guid = selected_guid
    ini_write_string("player", "guid", guid)
}
character = ini_read_string("player", "character", "P")
if (string_byte_length(guid) != 36)
    guid = ""
ini_close()
function data_change_name() //gml_Script_data_change_name
{
    ini_open("network.ini")
    selected_guid = get_string("Enter your Peppibot discord assigned password or keep empty to sign anonymously:", "")
    selected_guid = string_replace(selected_guid, " ", "")
    if (selected_guid == "")
        return 0;
    if (string_byte_length(selected_guid) != 36)
        selected_guid = ""
    guid = selected_guid
    if (selected_guid != "")
    {
        with (obj_online_manager)
            socket_signin()
    }
    ini_write_string("player", "guid", guid)
    ini_close()
}

