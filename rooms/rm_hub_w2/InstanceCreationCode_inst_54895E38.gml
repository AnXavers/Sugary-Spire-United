targetRoom = bee_1;
if global.newlvldesign == 2
	targetRoom = bee_1_old;
targetDoor = "A";
level = "bee";
details = [gate_createlayer(spr_bee_startgate, 0), gate_createlayer(spr_bee_startgate, 1), gate_createlayer(spr_bee_startgate, 2)];
info = 
{
	bginfo: [spr_beecard_beegee, 2, 4, 8, 0, 0],
	titleinfo: [spr_beecard_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_bee_title
};
