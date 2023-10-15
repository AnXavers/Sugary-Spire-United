depth = 300
targetRoom = tutorial_1;
targetDoor = "A";
level = "tutorial";
details = [gate_createlayer(spr_tutorial_startgate, 0), gate_createlayer(spr_tutorial_startgate, 1), gate_createlayer(spr_tutorial_startgate, 2, 0.5), gate_createlayer(spr_tutorial_startgate, 3, 0.35), gate_createlayer(spr_tutorial_startgate, 4, 0.15)];
info = 
{
	bginfo: [spr_entrycard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrycard_title, 0, 5, 6, 672, 160],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entryway_title
};
