if global.newlvldesign == 3
	targetRoom = entryway_1_custom;
else if global.newlvldesign == 2
	targetRoom = entryway_1_old;
else if global.newlvldesign == 1
	targetRoom = entryway_1_new;
else
	targetRoom = entryway_1;
targetDoor = "A";
level = "entryway";
details = [gate_createlayer(spr_entry_startgate, 0), gate_createlayer(spr_entry_startgate, 1), gate_createlayer(spr_entry_startgate, 2, 0.5), gate_createlayer(spr_entry_startgate, 3, 0.35), gate_createlayer(spr_entry_startgate, 4, 0.15), gate_createlayer(spr_entry_startgate, 5, 0)];
info = 
{
	bginfo: [spr_entrycard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrycard_title, 0, 5, 6, 672, 160],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entryway_title
};