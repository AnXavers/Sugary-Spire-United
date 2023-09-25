targetRoom = dance_1;
if global.newlvldesign == 2
	targetRoom = dance_1_old;
targetDoor = "A";
level = "dance";
info = 
{
	bginfo: [spr_dancecard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_dancecard_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_bee_title
};
details = [gate_createlayer(spr_dance_startgate, 0), gate_createlayer(spr_dance_startgate, 1), gate_createlayer(spr_dance_startgate, 4, 1), gate_createlayer(spr_dance_startgate, 3, 0.66), gate_createlayer(spr_dance_startgate, 2, 0.33)];
