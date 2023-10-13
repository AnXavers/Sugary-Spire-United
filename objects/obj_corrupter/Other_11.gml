///@description Set random global variable to random.
var varlist = variable_struct_get_names(global)
var varname = varlist[irandom((array_length(varlist) - 1))]
var variable = new VarRef(global, varname);
var vartype = typeof(variable)
if (vartype == "number" || vartype == "int32" || vartype == "int64")
	variable.set(random_range(-65536, 65536))
else if vartype == "string"
	variable.set(string_random(-4, irandom(64)))
else if vartype == "bool"
	variable.set(irandom(1))