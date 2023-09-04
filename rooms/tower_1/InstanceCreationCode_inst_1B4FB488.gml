targetRoom = entrance_1;
targetDoor = "A";
level = "entrance";
details = [gate_createlayer(spr_gate_entrance, 0), gate_createlayer(spr_gate_entrance, 1), gate_createlayer(spr_gate_entranceBG, 2, 0.5), gate_createlayer(spr_gate_entranceBG, 3, 0.35), gate_createlayer(spr_gate_entranceBG, 4, 0.15)];
info = 
{
	bginfo: [spr_titlecards, 2, 4, 8, 0, 0],
	titleinfo: [spr_titlecards_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entrance_title
};
