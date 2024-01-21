depth = -100;
ini_open("optionData.ini");

/*
Examples
For a category, [Is a Category? (True), Category Name, Description, Icon, [Options/Subcategories]]
For an option, [Is a Category? (False), Option Name, Description, Icon, [[Value name, Preview (Sequence)], [Value name, Preview (Sequence)], ...], Set Value]
Templates
For a category, [true, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, []]
For an option, [false, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, [["PLACEHOLDER NAME", seq_option_placeholder]] ini_read_real("ModSettings", "Placeholder", 0)]
*/
global.modoptions = [

[true, "VIDEO", "PLACEHOLDER DESCRIPTION", spr_null, [
[false, "SCORE FONT", "PLACEHOLDER DESCRIPTION", spr_null, [["P RANK", seq_option_placeholder], ["CANDLE", seq_option_placeholder]], ini_read_real("ModSettings", "ScoreFont", 0)],
]],

[true, "AUDIO", "PLACEHOLDER DESCRIPTION", []],

[true, "GAMEPLAY", "PLACEHOLDER DESCRIPTION", []],

[true, "LANGUAGE", "PLACEHOLDER DESCRIPTION", []]

]