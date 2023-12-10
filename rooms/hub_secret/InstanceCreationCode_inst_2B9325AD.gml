targetRoom = secrets_start;
targetDoor = "A";
level = "secrets";
details = [gate_createlayer(spr_secrets_startgate, 0), gate_createlayer(spr_secrets_startgate, 1), gate_createlayer(spr_secrets_startgate, 2, 0.5)];
info = 
{
	bginfo: [spr_secretscard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_secretscard_title, 0, 5, 6, 0, 0],
	featuringinfo: [0, 5, 6, 200, 350],
	song: mu_entryway_title
};
