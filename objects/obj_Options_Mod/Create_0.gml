depth = -100;
ini_open("optionData.ini");
/*
Examples
For a category, [Is a Category? (True), Category Name, Description, Icon, [Options/Subcategories]]
For an option, [Is a Category? (False), Option Name, Description, Icon, [[Value name, Preview (Sequence)], [Value name, Preview (Sequence)], ...], Loaded Value, Set Value]
Templates
For a category, [true, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, []]
For an option, [false, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, [[, ], [Value name, Preview (Sequence)], ...], Loaded Value, Set Value]
*/
global.modoptions = [
["VIDEO", "PLACEHOLDER DESCRIPTION", [["NEW SCORE FONT", "PLACEHOLDER DESCRIPTION", ["OFF", "ON"]], []]],
["AUDIO", "PLACEHOLDER DESCRIPTION", []],
["GAMEPLAY", "PLACEHOLDER DESCRIPTION", []],
["LANGUAGE", "PLACEHOLDER DESCRIPTION", []]
]