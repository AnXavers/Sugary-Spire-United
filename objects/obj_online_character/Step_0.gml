if active
    opacity += ((active - opacity) / 8)
else
    opacity = Approach(opacity, 0, 0.2)
scroll_x += (((selected_char * grid_size) - scroll_x) / 6)
scroll_y += (((selected_pal * grid_size) - scroll_y) / 6)
var _characters = characters
var _charvars = charvars
if (!active)
{
    with (obj_player1)
    {
        if ((!is_controllock()) && grounded && state == states.normal)
        {
            if keyboard_check_pressed(ord("P"))
            {
                if keyboard_check(vk_control)
                    other.characters = other.jokechars
                else
                    other.characters = other.normalchars
                other.selected_char = get_charindex()
                other.selected_pal = get_palindex()
                other.scroll_x = (other.selected_char * other.grid_size)
                other.scroll_y = (other.selected_pal * other.grid_size)
                other.active = 1
            }
        }
    }
}
else
{
    scr_getinput(1)
    var move_x = 0
    var move_y = 0
    move_x += (key_left2 + key_right2)
    move_y += (key_up2 - key_down2)
    if (key_left == -1)
    {
        if (held_move_x > 0)
            held_move_x = 0
        held_move_x--
    }
    else if key_right
    {
        if (held_move_x < 0)
            held_move_x = 0
        held_move_x++
    }
    else
        held_move_x = 0
    if key_up
    {
        if (held_move_y < 0)
            held_move_y = 0
        held_move_y++
    }
    else if key_down
    {
        if (held_move_y > 0)
            held_move_y = 0
        held_move_y--
    }
    else
        held_move_y = 0
    if (abs(held_move_x) > 30 && (held_move_x % 2) == 0)
        move_x += sign(held_move_x)
    if (abs(held_move_x) > 150 && (abs(held_move_x) % 2) == 1)
        move_x += sign(held_move_x)
    if (abs(held_move_x) > 330)
        move_x += sign(held_move_x)
    if (abs(held_move_y) > 30 && (held_move_y % 2) == 0)
        move_y += sign(held_move_y)
    if (abs(held_move_y) > 150 && (abs(held_move_y) % 2) == 1)
        move_y += sign(held_move_y)
    if (abs(held_move_y) > 330)
        move_y += sign(held_move_y)
    selected_char += move_x
    if (selected_char < 0)
    {
        selected_char += array_length(_characters)
        scroll_x += (array_length(_characters) * grid_size)
    }
    if (selected_char >= array_length(_characters))
    {
        selected_char -= array_length(_characters)
        scroll_x -= (array_length(_characters) * grid_size)
    }
    var palcount = (array_length(palettes) + (sprite_get_width(characters[selected_char][3]) - default_palette_count))
    if (selected_pal < 0)
        selected_pal = 0
    if (selected_pal >= palcount)
        selected_pal = (palcount - 1)
    selected_pal += move_y
    if (selected_pal < 0)
        selected_pal += palcount
    if (selected_pal >= palcount)
        selected_pal -= palcount
    if (key_slap || key_start)
    {
        active = 0
        return "";
    }
    if key_jump
    {
        active = 0
        var charindex = selected_char
        var palindex = selected_pal
        with (obj_player1)
        {
            if (palindex >= array_length(other.palettes))
            {
                paletteselect = (other.default_palette_count + (palindex - array_length(other.palettes)))
                global.palettetexture = -4
                ini_open_from_string(obj_savesystem.ini_str)
                ini_write_real("Game", "palette", paletteselect)
                ini_write_string("Game", "palettetexture", "classic")
                obj_savesystem.ini_str = ini_close()
            }
            else
            {
                var arr = other.palettes[palindex]
                if (!is_undefined(arr))
                {
                    paletteselect = arr[2]
                    if (arr[2] == 12)
                        global.palettetexture = arr[3]
                    else
                        global.palettetexture = -4
                    ini_open_from_string(obj_savesystem.ini_str)
                    ini_write_real("Game", "palette", paletteselect)
                    ini_write_string("Game", "palettetexture", arr[0])
                    obj_savesystem.ini_str = ini_close()
                }
            }
            var oldchar = _characters[get_charindex()]
            scr_sound(sound_enemythrow)
            var char = _characters[charindex]
            character = char[0]
            for (i = 0; i < array_length(_charvars); i++)
                variable_instance_set(id, _charvars[i], 0)
            var touchedvars = []
            for (i = 0; i < array_length(oldchar[4]); i++)
            {
                name = oldchar[4][i]
                if (string_copy(name, 1, 7) == "global.")
                {
                    var globname = string_copy(name, 8, (string_length(name) - 7))
                    if (variable_global_get(globname) != 0)
                    {
                        variable_global_set(globname, 0)
                        if (!(scr_array_contains(touchedvars, name)))
                            array_push(touchedvars, name)
                    }
                }
            }
            for (i = 0; i < array_length(char[4]); i++)
            {
                name = char[4][i]
                if (string_copy(name, 1, 7) == "global.")
                {
                    globname = string_copy(name, 8, (string_length(name) - 7))
                    if (variable_global_get(globname) != 1)
                    {
                        variable_global_set(globname, 1)
                        if (!(scr_array_contains(touchedvars, name)))
                            array_push(touchedvars, name)
                    }
                }
                else
                {
                    variable_instance_set(id, name, 1)
                    if (!(scr_array_contains(touchedvars, name)))
                        array_push(touchedvars, name)
                }
            }
            scr_characterspr()
            global.mach_color1 = char[6]
            global.mach_color2 = char[7]
            send_online_character(char[5])
			if (character == "P")
				path = choose(sound_taunt1, sound_taunt2, sound_taunt3, sound_taunt4, sound_taunt5, sound_taunt6, sound_taunt7)
			else if (character == "T")
				path = sound_tauntpeppino
			else
				path = choose(sound_tauntpizzano1, sound_tauntpizzano2, sound_tauntpizzano3, sound_tauntpizzano4, sound_tauntpizzano5, sound_tauntpizzano6, sound_tauntpizzano7, sound_tauntpizzano8)
            with (global.online_sounds)
                send_sound(path, 3)
            scr_sound(path)
            tauntstoredmovespeed = movespeed
            tauntstoredvsp = vsp
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            state = states.backbreaker
            taunttimer = 10
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
        save_character()
    }
}
