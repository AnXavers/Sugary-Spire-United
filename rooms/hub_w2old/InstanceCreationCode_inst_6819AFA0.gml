targetRoom = estate_1;
if global.newlvldesign == 2
	targetRoom = estate_1_old;
else if global.newlvldesign == 1
	targetRoom = cafe_1;
targetDoor = "A";
level = "estate";
details = [gate_createlayer(spr_chocoa_startgate, 0), gate_createlayer(spr_chocoa_startgate, 1), gate_createlayer(spr_chocoa_startgate, 2, 0.55), gate_createlayer(spr_chocoa_startgate, 3, 0.33), gate_createlayer(spr_chocoa_startgate, 4, 0), gate_createlayer(spr_chocoa_startgate, 5, 0.11)];
info = 
{
	bginfo: [spr_chocoacard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_chocoacard_title, 0, 5, 6, 764, 100],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entryway_title
};
