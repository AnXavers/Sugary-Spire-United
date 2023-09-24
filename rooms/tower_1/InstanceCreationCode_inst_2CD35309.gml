targetRoom = dungeon_1;
targetDoor = "A";
level = "bloodsauce";
details = [gate_createlayer(spr_gate_dungeon, 0), gate_createlayer(spr_gate_dungeon, 1), gate_createlayer(spr_gate_dungeonBG, 1, 0.5), gate_createlayer(spr_gate_dungeonBG, 0, 0.35)];
info = 
{
	bginfo: [spr_bloodsaucecard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_bloodsaucecard_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_dungeon_title
};
