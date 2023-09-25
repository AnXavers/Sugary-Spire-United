for (var i = 0; room_exists(i); i++)
	global.roomlist[i] = room_get_name(i);
for (var i = 0; object_exists(i); i++)
	global.objectlist[i] = object_get_name(i);
for (var i = 0; script_exists(i); i++)
	global.scriptlist[i] = script_get_name(i);
for (var i = 0; sprite_exists(i); i++)
	global.spritelist[i] = sprite_get_name(i);
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
		description: "Activates escape and sets escape time.",
		arguments: ["<bool>", "<min>", "<sec>"],
		suggestions: [["true", "false"], [], []],
		argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
	};
}
function sh_panic()
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
function meta_panic()
{
	return 
	{
		description: "Activates escape and sets escape time.",
		arguments: ["<bool>", "<min>", "<sec>"],
		suggestions: [["true", "false"], [], []],
		argumentDescriptions: ["activate/deactivate escape", "set minutes", "set seconds"]
	};
}
function sh_sugarrush()
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
function meta_sugarrush()
{
	return 
	{
		description: "Activates escape and sets escape time.",
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
		description: "Toggles collision object visibility.",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: ["toggles visibility"]
	};
}
function sh_show_collisions()
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
function meta_show_collisions()
{
	return 
	{
		description: "Toggles collision object visibility.",
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
		global.showcollisionarray[i++] = obj_solid;
		global.showcollisionarray[i++] = obj_cameraRegion;
		global.showcollisionarray[i++] = obj_slope;
		global.showcollisionarray[i++] = obj_slopePlatform;
		global.showcollisionarray[i++] = obj_platform;
		global.showcollisionarray[i++] = obj_sidePlatform;
		global.showcollisionarray[i++] = obj_cottonplatform;
		global.showcollisionarray[i++] = obj_traingo;
		global.showcollisionarray[i++] = obj_traindestroy;
		global.showcollisionarray[i++] = obj_trainTurnTrigger;
		global.showcollisionarray[i++] = obj_trainSlowDownTrigger;
		global.showcollisionarray[i++] = obj_trainSpeedUpTrigger;
		global.showcollisionarray[i++] = obj_movingPlatformTrigger;
		global.showcollisionarray[i++] = obj_movingPlatform_attach;
		global.showcollisionarray[i++] = obj_secretdestroyable;
		global.showcollisionarray[i++] = obj_secretdestroyable_Point;
		global.showcollisionarray[i++] = obj_secretdestroyable_big;
		global.showcollisionarray[i++] = obj_secretdestroyable_bigPoint;
		global.showcollisionarray[i++] = obj_secretdestroyable_metal;
		global.showcollisionarray[i++] = obj_secretdestroyable_tiles2;
		global.showcollisionarray[i++] = obj_secretdestroyable_tiles3;
		global.showcollisionarray[i++] = obj_secretdestroyable_tiles4;
		global.showcollisionarray[i++] = obj_secretdestroyable_tiles5;
		global.showcollisionarray[i++] = obj_eventtrigger;
		global.showcollisionarray[i++] = obj_doortrigger_parent;
		global.showcollisionarray[i++] = obj_doorS;
		global.showcollisionarray[i++] = obj_doorA;
		global.showcollisionarray[i++] = obj_doorB;
		global.showcollisionarray[i++] = obj_doorC;
		global.showcollisionarray[i++] = obj_doorD;
		global.showcollisionarray[i++] = obj_doorE;
		global.showcollisionarray[i++] = obj_doorP;
		global.showcollisionarray[i++] = obj_grindRail;
		global.showcollisionarray[i++] = obj_grindRail_Slope;
		global.showcollisionarray[i++] = obj_minecartRail;
		global.showcollisionarray[i++] = obj_minecartRail_Slope;
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
		description: "Toggles debugmode.",
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
		description: "Allows you to go to another room.",
		arguments: ["<room>", "<door>"],
		suggestions: [global.roomlist, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
		argumentDescriptions: ["sets targetRoom", "sets targetDoor"]
	};
}
function sh_player_room()
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
function meta_player_room()
{
	return 
	{
		description: "Allows you to go to another room.",
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
		description: "Create an object.",
		arguments: ["<x>", "<y>", "<object>"],
		suggestions: [obj_player.x, obj_player.y, global.objectlist],
		argumentDescriptions: ["the X coordinate to create the object at", "the Y coordinate to create the object at", "the object to create"]
	};
}
function sh_instance_destroy()
{
	instance_destroy(asset_get_index(argument0[1]));
}
function meta_instance_destroy()
{
	return 
	{
		description: "Destroy an object.",
		arguments: ["<object>"],
		suggestions: [global.objectlist],
		argumentDescriptions: ["the object to destroy"]
	};
}
function sh_set_global_variable()
{
	variable_global_set(argument0[1], argument0[2]);
}
function meta_set_global_variable()
{
	return 
	{
		description: "Changes a global variable.",
		arguments: ["<global_variable>", "<value>"],
		suggestions: [0, 1],
		argumentDescriptions: ["the name of the global variable to change", "the value you want to change the variable to"]
	};
}
function sh_set_instance_variable()
{
	variable_instance_set(argument0[1], argument0[2], argument0[3]);
}
function meta_set_instance_variable()
{
	return 
	{
		description: "Changes an instance variable.",
		arguments: ["<object>", "<instance_variable>", "<value>"],
		suggestions: [global.objectlist, 1, 2],
		argumentDescriptions: ["the object which variable you want to change", "the name of the instance variable to change", "the value you want to change the variable to"]
	};
}
function sh_set_struct_variable()
{
	variable_struct_set(argument0[1], argument0[2], argument0[3]);
}
function meta_set_struct_variable()
{
	return 
	{
		description: "Changes a struct variable.",
		arguments: ["<struct>", "<struct_variable>", "<value>"],
		suggestions: [0, 1, 2],
		argumentDescriptions: ["the struct which variable you want to change", "the name of the struct variable to change", "the value you want to change the variable to"]
	};
}
function sh_print_global_variable()
{
	return string(variable_global_get(argument0[1]));
}
function meta_print_global_variable()
{
	return 
	{
		description: "Prints a global variable.",
		arguments: ["<global_variable>"],
		suggestions: [0],
		argumentDescriptions: ["the name of the global variable to print"]
	};
}
function sh_print_instance_variable()
{
	return string(variable_instance_get(argument0[1], argument0[2]));
}
function meta_print_instance_variable()
{
	return 
	{
		description: "Prints an instance variable.",
		arguments: ["<object>", "<instance_variable>"],
		suggestions: [global.objectlist, 1],
		argumentDescriptions: ["the object which variable you want to print", "the name of the instance variable to change"]
	};
}
function sh_print_struct_variable()
{
	return string(variable_struct_get(argument0[1], argument0[2]));
}
function meta_print_struct_variable()
{
	return 
	{
		description: "Prints a struct variable.",
		arguments: ["<struct>", "<struct_variable>"],
		suggestions: [0, 1],
		argumentDescriptions: ["the struct which variable you want to print", "the name of the struct variable to print"]
	};
}
function sh_petersprite()
{
	global.petersprite = argument0[1]
	global.peterimage = argument0[2]
	global.peterspeed = argument0[3]
	global.peterupdate = 1
	if !instance_exists(obj_petersprite)
		instance_create(obj_player.x, obj_player.y, obj_petersprite)
}
function meta_petersprite()
{
	return 
	{
		description: "Draws a sprite over the player's.",
		arguments: ["<sprite>", "<image>", "<image_speed>"],
		suggestions: [global.spritelist, 1, "0.35"],
		argumentDescriptions: ["the sprite to draw over the player.", "the sprite frame petersprite will start playing at.", "the speed at which the sprite will play at."]
	};
}
function sh_petersprite_reset()
{
	instance_destroy(obj_petersprite)
	obj_player.visible = true
}
function meta_petersprite_reset()
{
	return 
	{
		description: "Stops using petersprite and returns the player back to normal.",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
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
		description: "Toggle noclip.",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}
function sh_give_all()
{
	for (var numb = 1; numb < 6; numb++)
	{
		switch (numb)
		{
			case 1:
				spawn = obj_confectimallow;
				break;
			case 2:
				spawn = obj_confectichoco;
				break;
			case 3:
				spawn = obj_confecticrack;
				break;
			case 4:
				spawn = obj_confectiworm;
				break;
			case 5:
				spawn = obj_confecticandy;
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
function sh_play_sound()
{
	scr_sound(argument0[1])
}
function meta_play_sound()
{
	return 
	{
		description: "Plays a selected sound.",
		arguments: ["<sound>"],
		suggestions: [0],
		argumentDescriptions: ["The name of the sound to play."]
	};
}
function sh_game_end()
{
	game_end()
}
function meta_game_end()
{
	return 
	{
		description: "Ends the current game session.",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}
function sh_script_execute()
{
	script_execute(argument0[1])
}
function meta_script_execute()
{
	return 
	{
		description: "Executes the specified script.",
		arguments: ["<script>"],
		suggestions: [global.scriptlist],
		argumentDescriptions: ["The script to execute."]
	};
}
function sh_draw_sprite()
{
	draw_sprite(argument0[1], argument0[2], argument0[3], argument0[4])
}
function meta_draw_sprite()
{
	return 
	{
		description: "Draws the specified sprite in the room.",
		arguments: ["<sprite>", "<frame>", "<x>", "<y>"],
		suggestions: [global.spritelist, 1, obj_player.x, obj_player.y],
		argumentDescriptions: ["The sprite to draw.", "The frame you want to draw and/or start at.", "The X coordinate to draw the sprite at.", "The Y coordinate to draw the sprite at."]
	};
}
function sh_set_combo()
{
	global.combo = argument0[1]
	global.combotime = argument0[2]
	global.combofreeze =argument0[3]
}
function meta_set_combo()
{
	return 
	{
		description: "Sets the combo amount.",
		arguments: ["<combo>", "<combo_time>", "<combo_freeze>"],
		suggestions: [0, 1, 2],
		argumentDescriptions: ["the amount to change the combo to.", "the amount of time the combo will last for", "the amount of time the combo will be frozen for"]
	};
}
function sh_set_lap()
{
	global.lapcount = argument0[1]
}
function meta_set_lap()
{
	return 
	{
		description: "Sets the lap amount.",
		arguments: ["<lap>"],
		suggestions: [0],
		argumentDescriptions: ["the lap amount to change to."]
	};
}
function sh_room_live()
{
	if (asset_get_type(argument0[1]) == 3)
		room_set_live(asset_get_index(argument0[1]), true)
	else
		return "Can't find room " + string(argument0[1]);
}
function meta_room_live()
{
	return 
	{
		description: "Allows you to make a room live with GMLive.",
		arguments: ["<room>"],
		suggestions: [global.roomlist],
		argumentDescriptions: ["Room to turn live."]
	};
}
function sh_set_transformation()
{
	var _transfo = argument0[1];
	switch (_transfo)
	{
		case "Cottoncoated":
			obj_player.state = 98
			break;
		case "Frostburn":
			obj_player.state = 151
			break;
		case "UFO":
			obj_player.state = 48
			break;
		case "Seacream":
			obj_player.state = 146
			break;
		case "Fireass":
			obj_player.state = 108
			break;
		case "Bomb":
			obj_player.state = 22
			break;
		case "Marshdog":
			obj_player.state = 83
			break;
		case "Minecart":
			obj_player.state = 101
			break;
		case "Hook":
			obj_player.state = 126
			break;
		case "Orb":
			obj_player.state = 99
			break;
	}
}
function meta_set_transformation()
{
	return 
	{
		description: "Sets the player's transformation.",
		arguments: ["<transformation>"],
		suggestions: [["Cottoncoated", "Frostburn", "UFO", "SeaCream", "Fireass", "Minecart", "Tumble", "Marshdog", "Hook", "Bomb", "Orb"]],
		argumentDescriptions: ["the transformation to change to."]
	};
}
function sh_set_player_state()
{
	obj_player.state = argument0[1];
}
function meta_set_player_state()
{
	return 
	{
		description: "Sets the player's state.",
		arguments: ["<state>"],
		suggestions: [0],
		argumentDescriptions: ["the state to change to."]
	};
}
function sh_solidfellow()
{
	global.solidfellow = 1
}
function meta_solidfellow()
{
	return 
	{
		description: "Solidfellow.",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}
