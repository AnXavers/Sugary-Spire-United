///@description Set random instance variable to random.
var obj = irandom((array_length(global.objectlist) - 1))
if (instance_exists(obj) && obj != obj_player && obj != obj_camera && obj != obj_afterimagecontroller && obj != obj_corrupter && obj != obj_doortrigger_parent && obj != obj_door && obj != obj_hallway && obj != obj_shell && obj != obj_startgate)
{
	var inst = instance_random(obj)
	var varlist = variable_struct_get_names(inst)
	if array_length(varlist) != 0
	{
		var varname = varlist[irandom((array_length(varlist) - 1))]
		with inst
		{
			var variable = new VarRef(inst, varname);
			var vartype = typeof(variable)
			if (vartype == "number" || vartype == "int32" || vartype == "int64")
				variable.set(random_range(-65536, 65536));
			else if vartype == "string"
				variable.set(string_random(-4, irandom(64)));
			else if vartype == "bool"
				variable.set(irandom(1));
			else
			{
				var type = irandom(10)
				if type == 0
				{
					x = irandom(room_width)
					y = irandom(room_height)
				}
				if type == 1
				{
					image_xscale = random_range(-8, 8)
					image_yscale = random_range(-8, 8)
				}
				if type == 2
				{
					hspeed = random_range(-8, 8)
					vspeed = random_range(-8, 8)
				}
				if type == 3
					image_blend = irandom(c_white)
				if type == 4
					image_alpha = random(1)
				if type == 5
					image_speed = random_range(-10, 10)
				else
					sprite_index = irandom((array_length(global.spritelist) - 1))
			}
		}
	}
}