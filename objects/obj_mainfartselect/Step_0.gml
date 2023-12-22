scr_getinput();
if (abletomove)
{
	if (keyboard_check_pressed(vk_f2))
	{
		if (!instance_exists(obj_bestiary))
		{
			instance_create(0, 0, obj_bestiary);
			abletomove = false;
		}
	}
	if (keyboard_check_pressed(vk_delete) && selectedactive)
	{
		scr_sound(sound_step);
		abletomove = false;
		instance_create(0, 0, obj_erasefile);
	}
	if (-key_left2 && selected < 2 && !selectedactive)
	{
		scr_sound(sound_step);
		selected++;
	}
	if (key_right2 && selected > 0 && !selectedactive)
	{
		scr_sound(sound_step);
		selected--;
	}
	if key_jump
	{
		if !selectedactive
		{
			selectedactive = true
			scr_sound(sound_enemythrow);
			switch selected
			{
				case 3:
					global.fileselect = "saveData3.ini"
					break;
				case 2:
					global.fileselect = "saveData2.ini"
					break;
				default:
					global.fileselect = "saveData.ini"
					break;
			}
		}
		else if sprfile[selected] != asset_get_index("spr_file" + string(selected + 1) + "confirm")
		{
			scr_sound(sound_toppingot);
			abletomove = false;
			drawindex = 0
			sprfile[selected] = asset_get_index("spr_file" + string(selected + 1) + "confirm")
		}
	}
	if (key_escape && sprfile[selected] != asset_get_index("spr_file" + string(selected + 1) + "confirm"))
	{
		scr_sound(sound_enemyslap);
		selectedactive = false
	}
}
var justfarded = 0;
switch (selected)
{
	case 0:
		justfarded = 96;
		_message = "FILE 1";
		global.fileselect = "saveData.ini"
		break;
	case 1:
		justfarded = 480;
		_message = "FILE 2";
		global.fileselect = "saveData2.ini"
		break;
	case 2:
		justfarded = 828;
		_message = "FILE 3";
		global.fileselect = "saveData3.ini"
		break;
}
if (drawindex >= 12 && sprfile[selected] == asset_get_index("spr_file" + string(selected + 1) + "confirm") && !instance_exists(obj_fadeout))
{
	obj_player.targetRoom = scootercutsceneidk;
	obj_player.targetDoor = "A";
	ini_open(global.fileselect);
	obj_player.character = ini_read_string("Carryover", "player", "P");
	ini_close();
	instance_create(x, y, obj_fadeout);
}
var _targetcoords
if selectedactive
{
	_targetcoords = filecoords[selected]
	_targetcoords = [lerp(_targetcoords[0], 560, 0.05), lerp(_targetcoords[1], -40, 0.05)]
	filecoords[selected] = _targetcoords
	bgalpha = approach(bgalpha, 1, 0.05)
}
else
	bgalpha = approach(bgalpha, 0, 0.05)
if (!selectedactive || (selectedactive && selected != 0))
	filecoords[0] = [lerp(filecoords[0][0], 680, 0.05), lerp(filecoords[0][1], 0, 0.05)]
if (!selectedactive || (selectedactive && selected != 1))
	filecoords[1] = [lerp(filecoords[1][0], 280, 0.05), lerp(filecoords[1][1], 0, 0.05)]
if (!selectedactive || (selectedactive && selected != 2))
	filecoords[2] = [lerp(filecoords[2][0], 0, 0.05), lerp(filecoords[2][1], 0, 0.05)]
lightX = lerp(lightX, justfarded, 0.2);
var asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_5C74AFEA");
layer_sprite_index(asset, selected);
if (showtext == 1)
	yi = approach(yi, 490, 5);
xi = 480 + random_range(1, -1);
drawindex += 0.35
bg_scroll++