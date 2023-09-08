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
colors[0] = choose(0, 1, 2, 3, 4, 5, 6);
colors[1] = choose(0, 1, 2, 3, 4, 5, 6);
colors[2] = choose(0, 1, 2, 3, 4, 5, 6);
colors[3] = choose(0, 1, 2, 3, 4, 5, 6);
colors[4] = choose(0, 1, 2, 3, 4, 5, 6);
colors[5] = choose(0, 1, 2, 3, 4, 5, 6);
colors[6] = choose(0, 1, 2, 3, 4, 5, 6);
colors[7] = choose(0, 1, 2, 3, 4, 5, 6);
colors[8] = choose(0, 1, 2, 3, 4, 5, 6);
colors[9] = choose(0, 1, 2, 3, 4, 5, 6);
colors[10] = choose(0, 1, 2, 3, 4, 5, 6);
colors[11] = choose(0, 1, 2, 3, 4, 5, 6);
colors[12] = choose(0, 1, 2, 3, 4, 5, 6);
pshake = false;
details = [gate_createlayer(spr_default_startgate, 0), gate_createlayer(spr_default_startgate, 1), gate_createlayer(bg_thumbnail_cone, 0, 1, 1)];

confecti_sprs[0] = 
{
	sprite: spr_marshmellow_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[1] = 
{
	sprite: spr_chocolate_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[2] = 
{
	sprite: spr_crack_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[3] = 
{
	sprite: spr_gummyworm_taunt,
	image: choose(0, 1, 2)
};
confecti_sprs[4] = 
{
	sprite: spr_candy_taunt,
	image: choose(0, 1, 2)
};

info = 
{
	bginfo: [spr_entrycard_bg, 2, 4, 8, 0, 0],
	titleinfo: [spr_entrycard_title, 0, 5, 6, 672, 160],
	song: mu_entryway_title
};
