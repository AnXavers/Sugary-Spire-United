depth = -100

settings = ds_map_create()
selected = [""]

function category_create(_nameid, _subids, _name = -1, _icon = -1)
{
	ds_map_add(settings, _nameid,
	{
		subids: _subids,
		name: _name,
		icon: _icon,
	}
	)
}
function option_create(_nameid, _optionnames, _name = -1, _icon = -1, _sequence = -1)
{
	ds_map_add(settings, _nameid,
	{
		optionnames: _optionnames,
		name: _name,
		icon: _icon,
		sequence: _sequence,
	}
	)
}


/*
depth = -100;
selectedy = 0
selected = [0, 0, 0]
ini_open("optionData.ini");

	Descriptions
	For a category, [Type (0), Category Name, Description, Icon, [Options/Subcategories]]
	For an option, [Type (1), Option Name, Description, Icon, [[Value name, Preview (Sequence)], [Value name, Preview (Sequence)], ...], Set Value]
	Templates
	For a category, [0, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, []]
	For an option, [1, "PLACEHOLDER NAME", "PLACEHOLDER DESCRIPTION", spr_null, [["PLACEHOLDER NAME", seq_option_placeholder]] ini_read_real("ModSettings", "Placeholder", 0)]

global.modoptions = [

[0, "VIDEO", "PLACEHOLDER DESCRIPTION", spr_null, [
	[1, "SCORE FONT", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["CANDLE", seq_option_placeholder], 
		["P-RANK", seq_option_placeholder]
		], ini_read_real("ModSettings", "scorefont", 0)],
	[1, "PLAYER ANIMATIONS", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["P-RANK", seq_option_placeholder], 
		["CLASSIC", seq_option_placeholder], 
		["ALTERNATE", seq_option_placeholder]
		], ini_read_real("ModSettings", "playeranim", 0)],
	[1, "E RANK", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["OFF", seq_option_placeholder], 
		["ON, NO STACKING", seq_option_placeholder], 
		["ON, NUMBERED STACKING", seq_option_placeholder], 
		["ON, LENGTHEN STACKING", seq_option_placeholder]
		], ini_read_real("ModSettings", "erank", 0)],
	[1, "SLOPE ANGLE", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["OFF", seq_option_placeholder], 
		["ON", seq_option_placeholder]
		], ini_read_real("ModSettings", "slopeangle", 0)],
	[1, "COMBO STYLE", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["EGGPLANT", seq_option_placeholder], 
		["DEMO", seq_option_placeholder]
		], ini_read_real("ModSettings", "combostyle", 0)],
	[1, "TV STYLE", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["PRE-DEMO", seq_option_placeholder], 
		["HEAD", seq_option_placeholder]
		], ini_read_real("ModSettings", "hudstyle", 0)],
	[1, "TV ANIMATIONS", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["P-RANK", seq_option_placeholder]
		], ini_read_real("ModSettings", "tvanimations", 0)],
	[1, "SCORE STYLE", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["RANK CAKE", seq_option_placeholder], 
		["TV", seq_option_placeholder]
		], ini_read_real("ModSettings", "scorestyle", 0)],
	[1, "FLIPPED HUD", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["OFF", seq_option_placeholder], 
		["ON", seq_option_placeholder], 
		["HEAD", seq_option_placeholder]
		], ini_read_real("ModSettings", "flippedhud", 0)],
	[1, "VOICELINES", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["CLASSIC", seq_option_placeholder], 
		["HEAD", seq_option_placeholder]
		], ini_read_real("ModSettings", "voicelines", 0)],
	[1, "DESTROYABLES", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["DEMO", seq_option_placeholder], 
		["SEPTEMBER", seq_option_placeholder], 
		["CLASSIC", seq_option_placeholder]
		], ini_read_real("ModSettings", "destroyables", 0)],
	[1, "COLLECTS", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["FINALIZED", seq_option_placeholder], 
		["P-RANK", seq_option_placeholder], 
		["DEMO", seq_option_placeholder], 
		["CLASSIC", seq_option_placeholder]
		], ini_read_real("ModSettings", "collects", 0)],
	[1, "RANK STYLE", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["P-RANK", seq_option_placeholder], 
		["DANCE & CAFE", seq_option_placeholder], 
		["DEMO", seq_option_placeholder], 
		["CLASSIC", seq_option_placeholder]
		], ini_read_real("ModSettings", "rankstyle", 0)],
	[1, "RICH PRESENCE", "PLACEHOLDER DESCRIPTION", spr_null, 
		[2, 
		["OFF", seq_option_placeholder], 
		["ON", seq_option_placeholder], 
		["HEAD", seq_option_placeholder]
		], ini_read_real("ModSettings", "richpresence", 0)],
]],

[0, "AUDIO", "PLACEHOLDER DESCRIPTION", spr_null, [
	[1, "MACH SFX", "PLACEHOLDER DESCRIPTION", spr_null, [2, 
		["FINALIZED", seq_option_placeholder], 
		["CLASSIC", seq_option_placeholder]
		], ini_read_real("ModSettings", "machsfx", 0)],
]],

[0, "GAMEPLAY", "PLACEHOLDER DESCRIPTION", spr_null, [

]],

[1, "LANGUAGE", "PLACEHOLDER DESCRIPTION", spr_null, 
	[2,
	["ENGLISH", seq_option_placeholder], 
	["SPANISH", seq_option_placeholder], 
	["PORTUGESE", seq_option_placeholder]
	], ini_read_real("ModSettings", "language", 0)
],

]

*/