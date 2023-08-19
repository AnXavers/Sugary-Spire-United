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
	if (keyboard_check_pressed(vk_delete))
	{
		scr_sound(sound_step);
		abletomove = false;
		instance_create(0, 0, obj_erasefile);
	}
	if (-key_left2 && selected < 2)
	{
		scr_sound(sound_step);
		selected++;
	}
	if (key_right2 && selected > 0)
	{
		scr_sound(sound_step);
		selected--;
	}
	if (key_jump && selected == 0 && obj_file1.sprite_index != spr_file1confirm)
	{
		scr_sound(sound_toppingot);
		abletomove = false;
		obj_file1.image_index = 0;
		obj_file1.sprite_index = spr_file1confirm;
	}
	if (key_jump && selected == 1 && obj_file1.sprite_index != spr_file2confirm)
	{
		scr_sound(sound_toppingot);
		abletomove = false;
		obj_file2.image_index = 0;
		obj_file2.sprite_index = spr_file2confirm;
	}
	if (key_jump && selected == 2 && obj_file1.sprite_index != spr_file3confirm)
	{
		scr_sound(sound_toppingot);
		abletomove = false;
		obj_file3.image_index = 0;
		obj_file3.sprite_index = spr_file3confirm;
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
lightX = lerp(lightX, justfarded, 0.2);
var asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_5C74AFEA");
layer_sprite_index(asset, selected);
if (showtext == 1)
	yi = approach(yi, 490, 5);
xi = 480 + random_range(1, -1);
