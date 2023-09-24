targetRoom = entrance_1;
targetDoor = "A";
level = "entrance";
details = [gate_createlayer(spr_gate_entrance, 0), gate_createlayer(spr_gate_entrance, 1), gate_createlayer(spr_gate_entranceBG, 2, 0.5), gate_createlayer(spr_gate_entranceBG, 1, 0.35), gate_createlayer(spr_gate_entranceBG, 0, 0.2)];
info = 
{
	bginfo: [spr_entrancecard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrancecard_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entrance_title
};
