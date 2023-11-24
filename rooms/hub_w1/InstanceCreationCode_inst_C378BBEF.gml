targetRoom = mines_1;
targetDoor = "A";
level = "mines";
details = [gate_createlayer(spr_mines_startgate, 0), gate_createlayer(spr_mines_startgate, 1), gate_createlayer(spr_mines_startgate, 2, 1), gate_createlayer(spr_mines_startgate, 3, 0.66), gate_createlayer(spr_mines_startgate, 4, 0.33)];
info = 
{
	bginfo: [spr_minescard_bg, 1, 5, 8, 0, 0],
	titleinfo: [spr_minescard_title, 0, 4, 7, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_mines_title
};
depth = 200