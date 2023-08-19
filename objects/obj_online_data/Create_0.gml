global.online_data = id
ini_open("network.ini")
ip = ini_read_string("network", "ip", "yoavhaik.com")
port = 6346
major_version = 3
minor_version = 2
build_version = 0
testbuild = 0
ifexperimental = 0
shared_panic = 1
shared_destruction = 1
shared_baddies = 1
shared_sounds = 1
shared_sprays = 1
spray_id = 0
spr_spraysprite = spr_null
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