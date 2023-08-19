var act_id = ds_map_find_value(async_load, "id")
if ds_map_exists(sprites, act_id)
{
    var ok = 1
    var status = ds_map_find_value(async_load, "status")
    if (status == 0 && (!ok))
    {
        var arr_data = ds_map_find_value(sprites, act_id)
        var spr = arr_data[0]
        var path = arr_data[1]
        sprite_replace(spr, path, 1, false, false, 50, 50)
    }
    if (status == 0 && ok)
        zip_unzip("SSUContent/sprites/sprite.zip", "SSUContent/sprites/sprite_extr/")
}
var size = array_length(async_sprays)
for (var i = 0; i < size; i++)
{
    if (async_sprays[i][0] == act_id)
    {
        status = ds_map_find_value(async_load, "status")
        if (status == 0)
        {
            var spray_sprite = async_sprays[i][1]
            var spray_id = async_sprays[i][2]
            path = ds_map_find_value(async_load, "result")
            var spray_path = ("SSUContent/sprays/" + string(spray_id))
            sprite_replace(spray_sprite, (spray_path + "/spray.gif"), 1, false, true, 0, 0)
            array_delete(async_sprays, i, 1)
            i--
            size--
        }
    }
}
size = array_length(async_pets)
for (i = 0; i < array_length(async_pets); i++)
{
    if (async_pets[i][0] == act_id)
    {
        status = ds_map_find_value(async_load, "status")
        if (status == 0)
        {
            var pet = async_pets[i][1]
            path = ds_map_find_value(async_load, "result")
            pet_path = ("SSUContent/pets/" + string(pet.p_id))
            files = zip_unzip(path, pet_path)
            file_delete(path)
            sprite_replace(pet.idle, (pet_path + "/pet_idle.png"), 1, true, true, 0, 0)
            sprite_replace(pet.run, (pet_path + "/pet_run.png"), 1, true, true, 0, 0)
            array_delete(async_pets, i, 1)
            i--
            size--
        }
    }
}
