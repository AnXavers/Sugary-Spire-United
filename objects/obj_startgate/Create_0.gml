image_index = 1;
image_speed = 0.35;
depth = 49;
level = "none";
showtext = false;
surf = -4;
fadewhite = 1;
bg_x = array_create(10);
bg_xscroll = [1, 0.66, 0.33, 0, 0, 0, 0, 0, 0, 0];
bg_y = array_create(10);
bg_yscroll = array_create(10, 0);
ini_open(global.fileselect);
var i = 0;
var _string = round(string_length(ini_read_string("Highscore", string(level), 0)));
var _string_length = string_length(_string) + 69;
for (i = 0; i < _string_length; i++)
	colors[i] = choose(0, 1, 2, 3, 4, 5, 6);
ini_close();
pshake = false;
details = [gate_createlayer(spr_default_startgate, 0), gate_createlayer(spr_default_startgate, 1), gate_createlayer(bg_thumbnail_cone, 0, 1, 1)];

confecti_sprs[0] = 
{
	sprite: obj_player.spr_confecti1_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[1] = 
{
	sprite: obj_player.spr_confecti2_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[2] = 
{
	sprite: obj_player.spr_confecti3_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[3] = 
{
	sprite: obj_player.spr_confecti4_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[4] = 
{
	sprite: obj_player.spr_confecti5_taunt,
	image: choose(0, 1, 2)
};

info = 
{
	bginfo: [spr_entrycard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrycard_title, 0, 5, 6, 672, 160],
	song: mu_entryway_title
};
