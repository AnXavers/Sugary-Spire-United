depth = -100;
ini_open("optionData.ini");

/*
Descriptions
For a category, [Is a Category? (True), Category Name, Description, Icon, [Options/Subcategories]]
For an option, [Is a Category? (False), Option Name, Description, Icon, [[Value name, Preview (Sequence)], [Value name, Preview (Sequence)], ...], Set Value]
Templates
For a category, [true, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, []]
For an option, [false, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, [["PLACEHOLDER NAME", seq_option_placeholder]] ini_read_real("ModSettings", "Placeholder", 0)]
*/

global.modoptions = [

[true, "VIDEO", "PLACEHOLDER DESCRIPTION", spr_null, [
[false, "SCORE FONT", "PLACEHOLDER DESCRIPTION", spr_null, [["CANDLE", seq_option_placeholder], ["P-RANK", seq_option_placeholder]], ini_read_real("ModSettings", "scorefont", 0)],
[false, "PLAYER ANIMATIONS", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["P-RANK", seq_option_placeholder], ["CLASSIC", seq_option_placeholder], ["ALTERNATE", seq_option_placeholder]], ini_read_real("ModSettings", "playeranim", 0)],
[false, "E RANK", "PLACEHOLDER DESCRIPTION", spr_null, [["OFF", seq_option_placeholder], ["ON, NO STACKING", seq_option_placeholder], ["ON, NUMBERED STACKING", seq_option_placeholder], ["ON, LENGTHEN STACKING", seq_option_placeholder]], ini_read_real("ModSettings", "erank", 0)],
[false, "SLOPE ANGLE", "PLACEHOLDER DESCRIPTION", spr_null, [["OFF", seq_option_placeholder], ["ON", seq_option_placeholder]], ini_read_real("ModSettings", "slopeangle", 0)],
[false, "COMBO STYLE", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["EGGPLANT", seq_option_placeholder], ["DEMO", seq_option_placeholder]], ini_read_real("ModSettings", "combostyle", 0)],
[false, "TV STYLE", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["PRE-DEMO", seq_option_placeholder], ["HEAD", seq_option_placeholder]], ini_read_real("ModSettings", "hudstyle", 0)],
[false, "TV ANIMATIONS", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["P-RANK", seq_option_placeholder]], ini_read_real("ModSettings", "tvanimations", 0)],
[false, "SCORE STYLE", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["RANK CAKE", seq_option_placeholder], ["TV", seq_option_placeholder]], ini_read_real("ModSettings", "scorestyle", 0)],
[false, "FLIPPED HUD", "PLACEHOLDER DESCRIPTION", spr_null, [["OFF", seq_option_placeholder], ["ON", seq_option_placeholder], ["HEAD", seq_option_placeholder]], ini_read_real("ModSettings", "flippedhud", 0)],
[false, "VOICELINES", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["CLASSIC", seq_option_placeholder], ["HEAD", seq_option_placeholder]], ini_read_real("ModSettings", "voicelines", 0)],
[false, "DESTROYABLES", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["DEMO", seq_option_placeholder], ["SEPTEMBER", seq_option_placeholder], ["CLASSIC", seq_option_placeholder]], ini_read_real("ModSettings", "destroyables", 0)],
[false, "COLLECTS", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["P-RANK", seq_option_placeholder], ["DEMO", seq_option_placeholder], ["CLASSIC", seq_option_placeholder]], ini_read_real("ModSettings", "collects", 0)],
[false, "RICH PRESENCE", "PLACEHOLDER DESCRIPTION", spr_null, [["OFF", seq_option_placeholder], ["ON", seq_option_placeholder], ["HEAD", seq_option_placeholder]], ini_read_real("ModSettings", "richpresence", 0)],
]],

[true, "AUDIO", "PLACEHOLDER DESCRIPTION", spr_null, [
[false, "MACH SFX", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["CLASSIC", seq_option_placeholder]], ini_read_real("ModSettings", "machsfx", 0)],
[false, "MACH SFX", "PLACEHOLDER DESCRIPTION", spr_null, [["FINALIZED", seq_option_placeholder], ["CLASSIC", seq_option_placeholder]], ini_read_real("ModSettings", "machsfx", 0)],
]],

[true, "GAMEPLAY", "PLACEHOLDER DESCRIPTION", spr_null, [

]],

[false, "LANGUAGE", "PLACEHOLDER DESCRIPTION", spr_null, [
["ENGLISH", seq_option_placeholder], 
["SPANISH", seq_option_placeholder], 
["PORTUGESE", seq_option_placeholder]
], ini_read_real("ModSettings", "language", 0)],

]