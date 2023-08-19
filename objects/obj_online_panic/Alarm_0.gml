var step_const = 12
global.pizzagal = 1
global.panic = 1
var r = string_letters(room_get_name(room))
fmod_event_instance_release(obj_music.panicmusicID)
obj_music.panicmusicID = fmod_event_create_instance("event:/united/music/pizzagalmusic")
if (global.levelname == "entrance" || global.levelname == "medieval" || global.levelname == "ruin" || global.levelname == "dungeon" || global.levelname == "badland" || global.levelname == "farm" || global.levelname == "saloon" || global.levelname == "plage" || global.levelname == "forest" || global.levelname == "space" || global.levelname == "minigolf" || global.levelname == "street" || global.levelname == "sewer" || global.levelname == "industrial" || global.levelname == "freezer" || global.levelname == "chateau" || global.levelname == "kidsparty" || global.levelname == "war" || global.levelname == "graveyard" || global.levelname == "midway")
{
    if (!instance_exists(obj_fadeout))
    {
        with (obj_player)
        {
            if (global.levelname != "war")
                targetDoor = "LAP"
            switch global.levelname
            {
                case "entrance":
                    targetRoom = entrance_10
                    break
                case "bloodsauce":
                    targetRoom = dungeon_10
                    break
                case "ruin":
                    targetRoom = ruin_11
                    break
                case "dungeon":
                    targetRoom = dungeon_10
                    break
                case "badland":
                    targetRoom = badland_10
                    break
                case "graveyard":
                    targetRoom = graveyard_6
                    break
                case "farm":
                    targetRoom = farm_11
                    break
                case "saloon":
                    targetRoom = saloon_6
                    break
                case "plage":
                    targetRoom = plage_cavern2
                    break
                case "forest":
                    targetRoom = forest_john
                    break
                case "space":
                    targetRoom = space_9
                    break
                case "minigolf":
                    targetRoom = minigolf_8
                    break
                case "street":
                    targetRoom = street_john
                    break
                case "sewer":
                    targetRoom = sewer_8
                    break
                case "industrial":
                    targetRoom = industrial_5
                    break
                case "freezer":
                    targetRoom = freezer_escape1
                    break
                case "chateau":
                    instance_create(obj_player1.x, obj_player1.y, obj_pizzagalghost)
                    targetRoom = chateau_9
                    break
                case "kidsparty":
                    targetRoom = kidsparty_john
                    if (character != "M")
                        shotgunAnim = 1
                    break
                case "war":
                    targetDoor = "A"
                    targetRoom = war_1
                    break
                case "midway":
                    targetRoom = midway_7
            }

        }
    }
    instance_create(0, 0, obj_fadeout)
    global.fill = 0
}
else if (r != "towertutorial" && string_copy(r, 1, 5) == "tower")
{
    global.fill = (step_const * 338)
    if (!instance_exists(obj_fadeout))
    {
        with (obj_player)
        {
            targetDoor = "C"
            targetRoom = tower_finalhallway
        }
        instance_create(0, 0, obj_fadeout)
        instance_create(obj_player1.x, obj_player1.y, obj_pizzagal)
        fmod_event_one_shot("event:/united/sfx/pizzaface/laughGAL")
    }
}
else
    global.fill = 0
