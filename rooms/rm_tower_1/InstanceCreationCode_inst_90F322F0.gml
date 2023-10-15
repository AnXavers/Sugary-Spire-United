targetRoom = ruin_1;
targetDoor = "A";
level = "ruin";
details = [gate_createlayer(spr_gate_ruin, 0), gate_createlayer(spr_gate_ruin, 1), gate_createlayer(spr_gate_ruinBG, 2, 0.5), gate_createlayer(spr_gate_ruinBG, 1, 0.35), gate_createlayer(spr_gate_ruinBG, 0, 0.2)];
info = 
{
	bginfo: [spr_ruincard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_ruincard_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_dungeon_title
};
