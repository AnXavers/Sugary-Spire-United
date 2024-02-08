global.music_map = ds_map_create();
global.secret_room = false;
global.secretmusic = -4;
global.VolumeModifier = 1
function add_music(argument0, argument1, argument2, argument3, argument4 = undefined)
{
	var b = 
	{
		music: argument1,
		secret_music: argument2,
		continuous: argument3,
		my_func: argument4
	};
	ds_map_set(global.music_map, argument0, b);
}
museffect = 0;
pausedmusic = 0;
prevmuID = -4;
target_gain = 1;
contTrack_pos = 0;
GummyBear = false;
music = undefined;
normalmusic = -1
escapemusic = -4;
default_escapemusic = mu_pizzelle_escape;
musicGain = 1;
force_continuous = false;
unforce_continuous = false;
ignore_change = false;
hard_force = false;
musicfadein = 0;
room_details = 
{
	music: -4,
	secret_music: -4,
	continuous: false,
	my_func: undefined,
};
add_music(rm_disclaimer, mu_paletteselect, mu_paletteselect, false);
add_music(rm_verify, mu_paletteselect, mu_paletteselect, false);
add_music(rm_introVideo, -4, -4, false);
add_music(devroom, mu_what, mu_what, false);
add_music(rm_missing, mu_void, mu_void, false);
add_music(realtitlescreen, mu_title, mu_title, false);
add_music(outer_room1, mu_title, mu_title, false);
add_music(hub_basement, mu_hubex, mu_hubex, true);
add_music(silver_0, mu_silver, mu_silver, true);
add_music(hub_secret, mu_hubw1, mu_hubw1, true);
add_music(hub_hallway, mu_hubw1, mu_hubw1, true);
add_music(hub_w1, mu_hubw1, mu_hubw1, true);
add_music(hub_w1old, mu_hubw1, mu_hubw1, true);
add_music(hub_w1oldold, mu_hubw1, mu_hubw1, true);
add_music(hub_w1oldoldold, mu_hubw1, mu_hubw1, true);
add_music(silver_1, mu_silver, mu_silver, true);
add_music(hub_shop1, mu_hubshop1, mu_hubshop1, true);
add_music(rm_painter, mu_outside, mu_outside, true);
add_music(hub_w2, mu_hubw2, mu_hubw2, true);
add_music(hub_w2old, mu_hubw2, mu_hubw2, true);
add_music(silver_2, mu_silver, mu_silver, true);
add_music(hub_shop2, mu_hubshop2, mu_hubshop2, true);
add_music(rm_pizzano, mu_outside, mu_outside, true);
add_music(hub_w3, mu_hubw3, mu_hubw3, true);
add_music(silver_3, mu_silver, mu_silver, true);
add_music(hub_shop3, mu_hubshop3, mu_hubshop3, true);
add_music(hub_outside, mu_outside, mu_outside, true);
add_music(hub_top, mu_credits, mu_credits, true);
add_music(rm_coneball, mu_danger, mu_danger, true);
add_music(tower_entrancehall, mu_tower1, mu_tower1, true);
add_music(tower_johngutterhall, mu_tower1, mu_tower1, true);
add_music(tower_1, mu_tower1, mu_tower1, true);
add_music(exitway_1, mu_exitway, mu_wafflesecret, false);
add_music(entrance_1, mu_entrance, mu_entrancesecret, false);
add_music(dungeon_1, mu_bloodsauce, mu_bloodsaucesecret, false);
add_music(ruin_1, mu_ancient1, mu_ancientsecret, false);
add_music(ruin_5, mu_ancient1, mu_ancientsecret, true);
add_music(ruin_6, mu_ancient2, mu_ancientsecret, true);
add_music(medieval_1, mu_pizzascape1, mu_pizzascapesecret, false);
add_music(medieval_5, mu_pizzascape1, mu_pizzascapesecret, true);
add_music(medieval_6, mu_pizzascape2, mu_pizzascapesecret, true);
add_music(rm_credits, mu_credits, mu_credits, false);
add_music(tutorial_1, mu_tutorial, mu_painter, false);
add_music(entryway_1, mu_waffle, mu_wafflesecret, false);
add_music(entryway_1_new, mu_waffle, mu_wafflesecret, false);
add_music(entryway_1_old, mu_waffle, mu_wafflesecret, false);
add_music(entryway_1_custom, mu_waffle, mu_wafflesecret, false);
add_music(steamy_1, mu_steamy, mu_steamysecret, false);
add_music(steamy_1_old, mu_steamy, mu_steamysecret, false);
add_music(steamy_7_old, mu_steamy, mu_steamysecret, true);
add_music(steamy_8_old, mu_steamyinner, mu_steamysecret, true);
add_music(molasses_1_old, mu_swamp1, mu_swampsecret, false);
add_music(molasses_6_old, mu_swamp1, mu_swampsecret, true);
add_music(molasses_6b_old, mu_swamp2, mu_swampsecret, true);
add_music(mines_1_old, mu_mineshaft1, mu_minessecret, false, function()
{
	if (global.minesProgress)
		return mu_mineshaft2;
	else
		return mu_mineshaft1;
});
add_music(mines_6_old, mu_mineshaft2, mu_minessecret, false);
add_music(steamy_7, mu_steamy, mu_steamysecret, true);
add_music(steamy_8, mu_steamyinner, mu_steamysecret, true);
add_music(molasses_1, mu_swamp1, mu_swampsecret, false);
add_music(molasses_6, mu_swamp1, mu_swampsecret, true);
add_music(molasses_6b, mu_swamp2, mu_swampsecret, true);
add_music(mines_1, mu_mineshaft1, mu_minessecret, false, function()
{
	if (global.minesProgress)
		return mu_mineshaft2;
	else
		return mu_mineshaft1;
});
add_music(mines_6, mu_mineshaft2, mu_minessecret, false);
add_music(mineshaft_1, mu_mineshaft1, mu_minessecret, false);
add_music(mountain_intro_old, mu_mountain1, mu_mountainsecret, false);
add_music(mountain_intro, mu_mountain1, mu_mountainsecret, false);
add_music(mountain_5, mu_mountain1, mu_mountainsecret, true);
add_music(mountain_6, mu_mountain2, mu_mountainsecret, true);
add_music(dance_1_old, mu_dance, mu_dancesecret, false);
add_music(dance_1, mu_dance, mu_dancesecret, false);
add_music(dance_8, mu_dance, mu_dancesecret, true);
add_music(dance_9, mu_dance2_2, mu_dancesecret, true);
add_music(sucrose_1, mu_sucrose, mu_sucrosesecret, false);
add_music(estate_1_new, mu_estate, mu_estatesecret, false);
add_music(estate_1_old, mu_estate, mu_estatesecret, false);
add_music(estate_1, mu_estate, mu_estatesecret, false);
add_music(estate_6, mu_estate, mu_estatesecret, true);
add_music(estate_dog, mu_danger, mu_estatesecret, true);
add_music(bee_1_old, mu_bee, mu_what, false);
add_music(bee_1, mu_bee, mu_what, false);
add_music(martian_1, mu_martian, mu_what, false);
add_music(rm_painterarena, mu_painter, mu_painter, false);
add_music(rm_pizzanoarena, mu_pizzanothemetune, mu_pizzanothemetune, true);
add_music(rm_coneballarena, mu_coneball1, mu_coneball1, true);
add_music(stormy_12, mu_exitway, mu_steamysecret, false);
add_music(stormy_7, mu_stormy2_old, mu_steamysecret, true);
add_music(stormy_8, mu_exitway, mu_steamysecret, true);
add_music(options_room, mu_confectionary, mu_confectionary, true);
add_music(secrets_start, mu_secrets, mu_secrets, false);
audio_sound_loop_start(mu_waffle, 34.9);
audio_sound_loop_end(mu_waffle, 218.18);
audio_sound_loop_start(mu_steamy, 8);
audio_sound_loop_end(mu_steamy, 144);
audio_sound_loop_start(mu_noise_lap, 0);
audio_sound_loop_end(mu_noise_lap, 147.76);
