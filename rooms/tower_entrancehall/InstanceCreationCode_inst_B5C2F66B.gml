targetRoom = tower_tutorial1;
targetDoor = "A";
level = "towertutorial";
details = [gate_createlayer(spr_gate_tutorial, 0), gate_createlayer(spr_gate_tutorial, 1), gate_createlayer(spr_gate_tutorialBG, 1, 0.5), gate_createlayer(spr_gate_tutorialBG, 0, 0.35)];
info = 
{
	bginfo: [spr_entrycard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrycard_title, 0, 5, 6, 672, 160],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entryway_title
};
