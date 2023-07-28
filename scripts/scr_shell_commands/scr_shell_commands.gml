for (var i = 0; room_exists(i); i++)
	global.roomlist[i] = room_get_name(i);
function sh_escape()
{
	var arg0 = string(argument0[1]);
	var arg1 = argument0[2];
	var arg2 = argument0[3];
	switch (arg0)
	{
		case "true":
		case "1":
			arg0 = true;
			break;
		case "false":
		case "0":
			arg0 = false;
			break;
		default:
			arg0 = !global.panic;
			break;
	}
	global.panic = arg0;
	var _minutes = real(string_digits(arg1));
	var _seconds = real(string_digits(arg2));
	global.fill = ((_minutes * 60) + _seconds) * 60;
	global.wave = 0;
	global.maxwave = global.fill;
	if (!instance_exists(obj_panicchanger))
		instance_create(x, y, obj_panicchanger);
}
function meta_escape()
{
	return 
	{
		description: "activates escape and sets escape time",
		arguments: ["<bool>", "<min>", "<sec>"],
		suggestions: [["true", "false"], [], []],
		argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
	};
}
function sh_toggle_collisions()
{
	var arg1 = argument0[1];
	switch (arg1)
	{
		case "true":
		case "1":
			arg1 = true;
			break;
		case "false":
		case "0":
			arg1 = false;
			break;
		default:
			arg1 = !global.showcollisions;
			break;
	}
	global.showcollisions = arg1;
	toggle_collision_function();
}
function meta_toggle_collisions()
{
	return 
	{
		description: "toggles collision object visibility",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: ["toggles visibility"]
	};
}
function toggle_collision_function()
{
	if (!variable_global_exists("showcollisionarray"))
	{
		var i = 0;
		global.showcollisionarray[i++] = 367;
		global.showcollisionarray[i++] = 104;
		global.showcollisionarray[i++] = 473;
		global.showcollisionarray[i++] = 152;
		global.showcollisionarray[i++] = 510;
		global.showcollisionarray[i++] = 167;
		global.showcollisionarray[i++] = 513;
		global.showcollisionarray[i++] = 41;
		global.showcollisionarray[i++] = 506;
		global.showcollisionarray[i++] = 503;
		global.showcollisionarray[i++] = 284;
		global.showcollisionarray[i++] = 354;
		global.showcollisionarray[i++] = 234;
		global.showcollisionarray[i++] = 490;
		global.showcollisionarray[i++] = 359;
		global.showcollisionarray[i++] = 591;
		global.showcollisionarray[i++] = 258;
		global.showcollisionarray[i++] = 28;
		global.showcollisionarray[i++] = 429;
		global.showcollisionarray[i++] = 46;
		global.showcollisionarray[i++] = 121;
		global.showcollisionarray[i++] = 482;
		global.showcollisionarray[i++] = 216;
		global.showcollisionarray[i++] = 107;
		global.showcollisionarray[i++] = 119;
		global.showcollisionarray[i++] = 2;
		global.showcollisionarray[i++] = 477;
		global.showcollisionarray[i++] = 478;
		global.showcollisionarray[i++] = 480;
		global.showcollisionarray[i++] = 222;
		global.showcollisionarray[i++] = 169;
		global.showcollisionarray[i++] = 74;
		global.showcollisionarray[i++] = 338;
		global.showcollisionarray[i++] = 96;
		global.showcollisionarray[i++] = 117;
		global.showcollisionarray[i++] = 93;
	}
	var array = global.showcollisionarray;
	var length = array_length(array);
	for (i = length - 1; i >= 0; i--)
	{
		with (array[i])
		{
			if (object_index == array[i])
			{
				visible = global.showcollisions;
				if (object_index != obj_solid && object_index != obj_slope)
					image_alpha = 0.6;
			}
		}
	}
}
function sh_toggle_debugmode()
{
	var arg1 = argument0[1];
	switch (arg1)
	{
		case "true":
		case "1":
			arg1 = true;
			break;
		case "false":
		case "0":
			arg1 = false;
			break;
		default:
			arg1 = !global.debugmode;
			break;
	}
	global.debugmode = arg1;
}
function meta_toggle_debugmode()
{
	return 
	{
		description: "toggles debugmode",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: ["toggles debugmode"]
	};
}
function sh_room_goto()
{
	var arg1 = asset_get_index(argument0[1]);
	var arg2 = argument0[2];
	if (asset_get_type(argument0[1]) != 3)
		return "Can't find room " + string(argument0[1]);
	if (asset_get_type(argument0[1]) == 3)
	{
		obj_player.targetRoom = arg1;
		obj_player.targetDoor = arg2;
		instance_create(0, 0, obj_fadeout);
	}
}
function meta_room_goto()
{
	return 
	{
		description: "allows you to go to another room",
		arguments: ["<room>", "<door>"],
		suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
		argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
	};
}
function sh_instance_create()
{
	instance_create(argument0[1], argument0[2], asset_get_index(argument0[3]));
}
function meta_instance_create()
{
	return 
	{
		description: "create an object",
		arguments: ["<x>", "<y>", "<object>"],
		suggestions: [0, 1, []],
		argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object to create"]
	};
}
function sh_noclip()
{
	if (obj_player.state != 128)
		obj_player.state = 128;
	else
		obj_player.state = 1;
}
function meta_noclip()
{
	return 
	{
		description: "toggle noclip",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}
function sh_fuckyou()
{
	audio_stop_sound(sound_youfuckindick);
	audio_stop_sound(sound_BITCH);
	scr_sound(sound_youfuckindick, sound_BITCH);
}
function meta_fuckyou()
{
	return 
	{
		description: "fuck you",
		arguments: [],
		suggestions: [],
		argumentDescriptions: [],
		hidden: true,
		deferred: false
	};
}
function sh_give_all()
{
	for (var numb = 1; numb < 6; numb++)
	{
		switch (numb)
		{
			case 1:
				var spawn = 485;
				break;
			case 2:
				spawn = 486;
				break;
			case 3:
				spawn = 487;
				break;
			case 4:
				spawn = 489;
				break;
			case 5:
				spawn = 488;
				break;
			default:
				break;
		}
		instance_create(x, y, spawn);
	}
	global.treasure = 1;
	global.secretfound = 3;
	global.collect = global.srank;
}
function meta_give_all()
{
	return 
	{
		description: "Gives you all 5 confecti, 3 secrets, secret treasure, and S rank score.",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}
